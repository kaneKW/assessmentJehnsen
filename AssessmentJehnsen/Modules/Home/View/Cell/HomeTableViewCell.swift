//
//  HomeTableViewCell.swift
//  AssessmentJehnsen
//
//  Created by Jehnsen Hirena Kane on 13/03/22.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    lazy var iconImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var nameLabel: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 13)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var symbolLabel: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 13)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var currentPriceLabel: UILabel = {
        let view = UILabel()
        view.textAlignment = .right
        view.adjustsFontSizeToFitWidth = true
        view.font = .systemFont(ofSize: 13)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var priceChangeLabel: UILabel = {
        let view = UILabel()
        view.textAlignment = .right
        view.adjustsFontSizeToFitWidth = true
        view.font = .systemFont(ofSize: 13)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var indicatorView: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupView()
    }
    
    func setupContent(data: CoinGeckoModel) {
        indicatorView.stopAnimating()
        nameLabel.text = data.name
        symbolLabel.text = data.symbolLabel
        if let currentPrice = data.currentPrice?.currencyString {
            currentPriceLabel.text = "current_price".localized() + " " + currentPrice + " " + "&currency&".localized()
        }
        if let priceChange = data.priceChange24h {
            priceChangeLabel.text = "price_change".localized() + " " + priceChange.description + "%"
            
            if priceChange > 0 {
                priceChangeLabel.textColor = .green
            } else {
                priceChangeLabel.textColor = .red
            }
        }
        guard let url = URL(string: data.iconUrl ?? "") else {
            return
        }
        iconImage.load(url: url)
    }
    
    func showLoadingView() {
        indicatorView.startAnimating()
    }
    
    func setupView() {
        addSubview(iconImage)
        addSubview(nameLabel)
        addSubview(symbolLabel)
        addSubview(currentPriceLabel)
        addSubview(priceChangeLabel)
        addSubview(indicatorView)
        
        NSLayoutConstraint.activate([
            iconImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            iconImage.heightAnchor.constraint(equalToConstant: 40),
            iconImage.widthAnchor.constraint(equalToConstant: 40),
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.centerYAnchor.constraint(equalTo: iconImage.topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: iconImage.trailingAnchor, constant: 16),
        ])
        
        NSLayoutConstraint.activate([
            symbolLabel.centerYAnchor.constraint(equalTo: iconImage.bottomAnchor),
            symbolLabel.leadingAnchor.constraint(equalTo: iconImage.trailingAnchor, constant: 16),
        ])
        
        NSLayoutConstraint.activate([
            currentPriceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant:-16),
            currentPriceLabel.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 16),
            currentPriceLabel.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor),
        ])
        
        NSLayoutConstraint.activate([
            priceChangeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            priceChangeLabel.leadingAnchor.constraint(equalTo: symbolLabel.trailingAnchor, constant: 16),
            priceChangeLabel.centerYAnchor.constraint(equalTo: symbolLabel.centerYAnchor),
        ])
        
        NSLayoutConstraint.activate([
            indicatorView.topAnchor.constraint(equalTo: topAnchor),
            indicatorView.bottomAnchor.constraint(equalTo: bottomAnchor),
            indicatorView.leadingAnchor.constraint(equalTo: leadingAnchor),
            indicatorView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
