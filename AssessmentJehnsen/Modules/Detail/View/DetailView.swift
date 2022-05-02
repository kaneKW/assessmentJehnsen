//
//  DetailView.swift
//  AssessmentJehnsen
//
//  Created by Jehnsen Hirena Kane on 24/04/22.
//

import UIKit

class DetailView: UIView {
    private lazy var iconImage: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var symbolLabel: UILabel = {
        let view = UILabel()
        view.text = "Data not available".localized()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var currentUSDPrice: UILabel = {
        let view = UILabel()
        view.text = "Data not available".localized()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var marketCapLabel: UILabel = {
        let view = UILabel()
        view.adjustsFontSizeToFitWidth = true
        view.text = "Data not available".localized()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var marketCapRank: UILabel = {
        let view = UILabel()
        view.text = "Data not available".localized()
        view.adjustsFontSizeToFitWidth = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var segmentTitleLabel: UILabel = {
        let view = UILabel()
        view.numberOfLines = 3
        view.text = "Current Price Change Percentage".localized()
        view.adjustsFontSizeToFitWidth = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var segmentValueLabel: UILabel = {
        let view = UILabel()
        view.text = "Data not available".localized()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var segmentedView: UISegmentedControl = {
        let timePriceChangePrecentage = ["24 hour".localized(),
                                         "7 day".localized(),
                                         "30 day".localized(),
                                         "1 year".localized()]
        let view = UISegmentedControl(items: timePriceChangePrecentage)
        view.selectedSegmentIndex = 0
        view.addTarget(self, action: #selector(didTapSegmentedView), for: .valueChanged)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var assetDescription: UITextView = {
        let view = UITextView()
        view.isEditable = false
        view.text = "Data not available".localized()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    @objc private func didTapSegmentedView(sender: UISegmentedControl) {
        var value: Float?
        switch sender.selectedSegmentIndex {
        case 0:
             value = (data?.marketData?.priceChange24h)
        case 1:
            value = (data?.marketData?.priceChange7d)
        case 2:
            value = (data?.marketData?.priceChange30d)
        case 3:
            value = (data?.marketData?.priceChange1y)
        default:
            return
        }
        segmentValueLabel.text =  (value?.description ?? "") + "%"
        segmentValueLabel.textColor = (value ?? 0) > 0 ? .green : .red
    }
    
    var data: CoinGeckoDetailModel? {
        didSet {
            updateContent()
        }
    }
    
    let isEnglish = Constant.shared.getCurrentLanguage() == "en" ? true : false
    
    init() {
        super.init(frame: .zero)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateContent() {
        guard let data = data else {return}
        DispatchQueue.main.async {
            self.symbolLabel.text = data.symbolLabel
            
            if let marketCapRank = data.marketCapRank {
                self.marketCapRank.text = "Market Cap Rank".localized() + " " + String(describing: marketCapRank)
            }
            
            if let marketCap = data.marketData?.coinMarketCap {
                var marketCapLocalized = Float()
                if self.isEnglish {
                    marketCapLocalized = marketCap.marketCapUSD ?? 0
                } else {
                    marketCapLocalized = marketCap.marketCapIDR ?? 0
                }
                self.marketCapLabel.text = "with market cap".localized() + " " + "\(marketCapLocalized.currencyString) " + "&currency&".localized()
            }
            
            if let currentPrice = data.marketData?.currentPrice {
                var currentPriceLocalized = Float()
                if self.isEnglish {
                    currentPriceLocalized = currentPrice.usd ?? 0
                } else {
                    currentPriceLocalized = currentPrice.idr ?? 0
                }
                self.currentUSDPrice.text =  "current_price".localized() +  " \(currentPriceLocalized.currencyString) " + "&currency&".localized()
            }
            
            if let description = data.description {
                var descriptionLocalized = String()
                if self.isEnglish {
                    descriptionLocalized = description.en ?? ""
                } else {
                    descriptionLocalized = description.id ?? ""
                }
                
                descriptionLocalized = descriptionLocalized.isEmpty ? "Data not available".localized() : descriptionLocalized
                self.assetDescription.attributedText = descriptionLocalized.htmlToAttributedString
            }
            
            if let priceChange24 = data.marketData?.priceChange24h {
                self.segmentValueLabel.text = (priceChange24.description) + "%"
                self.segmentValueLabel.textColor = priceChange24 > 0 ? .green : .red
            }
            
            if let url = URL(string: data.iconUrl?.largeImage ?? "") {
                self.iconImage.load(url: url)
            }
        }
    }
    
    private func setupLayout() {
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
            iconImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            iconImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            iconImage.heightAnchor.constraint(equalToConstant: 150),
            iconImage.widthAnchor.constraint(equalToConstant: 150),
        ])
        
        NSLayoutConstraint.activate([
            symbolLabel.topAnchor.constraint(equalTo: iconImage.bottomAnchor, constant: 10),
            symbolLabel.centerXAnchor.constraint(equalTo: iconImage.centerXAnchor, constant: 0),
        ])
        
        NSLayoutConstraint.activate([
            currentUSDPrice.topAnchor.constraint(equalTo: symbolLabel.bottomAnchor, constant: 16),
            currentUSDPrice.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
        ])
        
        NSLayoutConstraint.activate([
            marketCapRank.topAnchor.constraint(equalTo: currentUSDPrice.bottomAnchor, constant: 16),
            marketCapRank.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            marketCapRank.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
        ])
        
        NSLayoutConstraint.activate([
            marketCapLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            marketCapLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            marketCapLabel.topAnchor.constraint(equalTo: marketCapRank.bottomAnchor, constant: 16)
        ])
        
        NSLayoutConstraint.activate([
            segmentTitleLabel.topAnchor.constraint(equalTo: marketCapLabel.bottomAnchor, constant: 16),
            segmentTitleLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            segmentTitleLabel.trailingAnchor.constraint(equalTo: segmentedView.leadingAnchor, constant: -16),
        ])
        
        NSLayoutConstraint.activate([
            segmentedView.centerYAnchor.constraint(equalTo: segmentTitleLabel.centerYAnchor),
            segmentedView.trailingAnchor.constraint(lessThanOrEqualTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            segmentedView.heightAnchor.constraint(equalToConstant: 50),
            segmentedView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 2/3)
        ])
        
        NSLayoutConstraint.activate([
            segmentValueLabel.topAnchor.constraint(equalTo: segmentedView.bottomAnchor, constant: 16),
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
