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
        view.text = "name"
        view.font = .systemFont(ofSize: 13)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var symbolLabel: UILabel = {
        let view = UILabel()
        view.text = "symbol"
        view.font = .systemFont(ofSize: 13)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var currentPriceLabel: UILabel = {
        let view = UILabel()
        view.text = "current price"
        view.font = .systemFont(ofSize: 13)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var priceChangeLabel: UILabel = {
        let view = UILabel()
        view.text = "pricechange"
        view.font = .systemFont(ofSize: 13)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupView()
    }
    
    func setupContent(data: CoinGeckoModel) {
        nameLabel.text = data.name
        symbolLabel.text = data.symbolLabel
        currentPriceLabel.text = data.currentPrice?.description
        priceChangeLabel.text = data.priceChange24h?.description
        guard let url = URL(string: data.iconUrl ?? "") else {
            return
        }
        iconImage.load(url: url)
    }
    
    func setupView() {
        addSubview(iconImage)
        addSubview(nameLabel)
        addSubview(symbolLabel)
        addSubview(currentPriceLabel)
        addSubview(priceChangeLabel)
        
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
            currentPriceLabel.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor),
        ])
        
        NSLayoutConstraint.activate([
            priceChangeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            priceChangeLabel.centerYAnchor.constraint(equalTo: symbolLabel.centerYAnchor),
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
