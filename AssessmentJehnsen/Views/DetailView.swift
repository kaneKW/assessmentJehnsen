//
//  DetailView.swift
//  AssessmentJehnsen
//
//  Created by Jehnsen Hirena Kane on 24/04/22.
//

import UIKit

class DetailView: UIView {
    private lazy var nameLabel: UILabel = {
        let view = UILabel()
        view.text = "ini name"
        view.isHidden = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var iconImage: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var symbolLabel: UILabel = {
        let view = UILabel()
        view.text = "ini symbol"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var currentUSDPrice: UILabel = {
        let view = UILabel()
        view.text = "ini current price"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var marketCapLabel: UILabel = {
        let view = UILabel()
        view.text = "ini market cap"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var marketCapRank: UILabel = {
        let view = UILabel()
        view.text = "ini market cap rank"
        view.adjustsFontSizeToFitWidth = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var segmentTitleLabel: UILabel = {
        let view = UILabel()
        view.text = "Current Price Change Percentage "
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var segmentValueLabel: UILabel = {
        let view = UILabel()
        view.text = "ini segment value"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var segmentedView: UISegmentedControl = {
        let view = UISegmentedControl()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var assetDescription: UITextView = {
        let view = UITextView()
        view.text = "ini description"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    init() {
        super.init(frame: .zero)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateContent(data: CoinGeckoDetailModel) {
        DispatchQueue.main.async {
            self.symbolLabel.text = data.symbolLabel
            
            if let marketCapRank = data.marketCapRank, let marketCap = data.marketData?.coinMarketCap?.marketCapUSD {
                self.marketCapRank.text = "Market Cap Rank \(String(describing: marketCapRank)) with market cap \(marketCap.description) USD"
            }
            
            if let currentPrice = data.marketData?.currentPrice?.usd {
                self.currentUSDPrice.text =  "Current Price \(currentPrice.description) USD"
            }
            
            if let description = data.description?.en {
                self.assetDescription.attributedText = description.htmlToAttributedString
            }
            
            
            if let url = URL(string: data.iconUrl?.largeImage ?? "") {
                self.iconImage.load(url: url)
            }
            
        }
        
    }
    
    private func setupLayout() {
        addSubview(nameLabel)
        addSubview(iconImage)
        addSubview(symbolLabel)
        addSubview(currentUSDPrice)
        addSubview(marketCapLabel)
        addSubview(marketCapRank)
        addSubview(segmentTitleLabel)
        addSubview(segmentedView)
        addSubview(segmentValueLabel)
        addSubview(assetDescription)
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            nameLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
        ])
        
        NSLayoutConstraint.activate([
            iconImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),
            iconImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            iconImage.heightAnchor.constraint(equalToConstant: 150),
            iconImage.widthAnchor.constraint(equalToConstant: 150),
        ])
        
        NSLayoutConstraint.activate([
            symbolLabel.topAnchor.constraint(equalTo: iconImage.bottomAnchor, constant: 24),
            symbolLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
        ])
        
        NSLayoutConstraint.activate([
            currentUSDPrice.centerYAnchor.constraint(equalTo: symbolLabel.centerYAnchor, constant: 0),
            currentUSDPrice.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
        ])
        
        NSLayoutConstraint.activate([
            marketCapRank.topAnchor.constraint(equalTo: currentUSDPrice.bottomAnchor, constant: 16),
            marketCapRank.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            marketCapRank.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
        ])
        
        NSLayoutConstraint.activate([
            marketCapLabel.centerYAnchor.constraint(equalTo: marketCapRank.centerYAnchor, constant: 0),
            marketCapLabel.leadingAnchor.constraint(equalTo: marketCapRank.trailingAnchor, constant: 16),
        ])
        
        NSLayoutConstraint.activate([
            segmentTitleLabel.topAnchor.constraint(equalTo: marketCapLabel.bottomAnchor, constant: 16),
            segmentTitleLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
        ])
        
        NSLayoutConstraint.activate([
            segmentedView.topAnchor.constraint(equalTo: segmentTitleLabel.bottomAnchor, constant: 16),
            segmentedView.leadingAnchor.constraint(equalTo: segmentTitleLabel.trailingAnchor, constant: 16),
            segmentedView.trailingAnchor.constraint(lessThanOrEqualTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            segmentedView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            segmentValueLabel.topAnchor.constraint(equalTo: segmentTitleLabel.bottomAnchor, constant: 16),
            segmentValueLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
        ])
        
        NSLayoutConstraint.activate([
            assetDescription.topAnchor.constraint(equalTo: segmentValueLabel.bottomAnchor, constant: 16),
            assetDescription.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            assetDescription.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            assetDescription.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0),
        ])
    }
}
