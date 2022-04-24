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
        view.text = "dummy"
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
        view.text = "dummy"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var currentUSDPrice: UILabel = {
        let view = UILabel()
        view.text = "dummy"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var marketCapLabel: UILabel = {
        let view = UILabel()
        view.text = "dummy"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var marketCapRank: UILabel = {
        let view = UILabel()
        view.text = "dummy"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var segmentTitleLabel: UILabel = {
        let view = UILabel()
        view.text = "dummy"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var segmentValueLabel: UILabel = {
        let view = UILabel()
        view.text = "ini value"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var segmentedView: UISegmentedControl = {
        let view = UISegmentedControl()
        view.setTitle("1", forSegmentAt: 0)
        view.setTitle("2", forSegmentAt: 1)
        view.setTitle("3", forSegmentAt: 2)
        view.setTitle("4", forSegmentAt: 3)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var assetDescription: UITextView = {
        let view = UITextView()
        view.text = "dummy"
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
            nameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            nameLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0),
            nameLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0),
        ])
        
        NSLayoutConstraint.activate([
            iconImage.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 16),
            iconImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconImage.heightAnchor.constraint(equalToConstant: 200),
            iconImage.widthAnchor.constraint(equalToConstant: 200),
        ])
        
        NSLayoutConstraint.activate([
            symbolLabel.topAnchor.constraint(equalTo: iconImage.bottomAnchor, constant: 24),
            symbolLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0),
        ])
        
        NSLayoutConstraint.activate([
            currentUSDPrice.centerYAnchor.constraint(equalTo: symbolLabel.centerYAnchor, constant: 0),
            currentUSDPrice.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0),
        ])
        
        NSLayoutConstraint.activate([
            marketCapRank.topAnchor.constraint(equalTo: currentUSDPrice.bottomAnchor, constant: 16),
            marketCapRank.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
        ])
        
        NSLayoutConstraint.activate([
            marketCapLabel.centerYAnchor.constraint(equalTo: marketCapRank.centerYAnchor, constant: 0),
            marketCapLabel.leadingAnchor.constraint(equalTo: marketCapRank.trailingAnchor, constant: -16),
        ])
        
        NSLayoutConstraint.activate([
            segmentTitleLabel.topAnchor.constraint(equalTo: marketCapLabel.bottomAnchor, constant: 16),
            segmentTitleLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0),
        ])
        
        NSLayoutConstraint.activate([
            segmentedView.topAnchor.constraint(equalTo: segmentTitleLabel.bottomAnchor, constant: 16),
            segmentedView.leadingAnchor.constraint(equalTo: segmentTitleLabel.trailingAnchor, constant: -16),
        ])
        
        NSLayoutConstraint.activate([
            segmentValueLabel.topAnchor.constraint(equalTo: segmentTitleLabel.bottomAnchor, constant: 16),
            segmentValueLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
        ])
        
        NSLayoutConstraint.activate([
            assetDescription.topAnchor.constraint(equalTo: segmentValueLabel.bottomAnchor, constant: 16),
            assetDescription.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0),
            assetDescription.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0),
            assetDescription.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0),
        ])
    }
}
