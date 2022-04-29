//
//  SettingItemView.swift
//  AssessmentJehnsen
//
//  Created by Jehnsen Hirena Kane on 29/04/22.
//

import UIKit

class SettingItemView: UIView {
    private lazy var labelContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = false
        return view
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "asdasdasdas"
        label.textAlignment = .center
        label.numberOfLines = 1
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

//    var didTapView: ((_ view: KoinBillProductItemView) -> Void)?

    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        translatesAutoresizingMaskIntoConstraints = false

//        if isNeedAddTapGesture {
//            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapProductItem))
//            addGestureRecognizer(tapGesture)
//        }
        setupLayout()
    }

//    @objc private func didTapProductItem() {
//        didTapView?(self)
//    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        labelContainerView.layer.cornerRadius = 8
    }

    private func setupLayout() {
        addSubview(labelContainerView)
        NSLayoutConstraint.activate([
            labelContainerView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            labelContainerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            labelContainerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            labelContainerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
//            labelContainerView.centerXAnchor.constraint(equalTo: centerXAnchor),
//            labelContainerView.widthAnchor.constraint(equalToConstant: 60),
//            labelContainerView.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        labelContainerView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: labelContainerView.topAnchor, constant: 4),
            titleLabel.bottomAnchor.constraint(equalTo: labelContainerView.bottomAnchor, constant: -4),
            titleLabel.leadingAnchor.constraint(equalTo: labelContainerView.leadingAnchor, constant: 4),
            titleLabel.trailingAnchor.constraint(equalTo: labelContainerView.trailingAnchor, constant: -4),
        ])

    }
//
//    func setupContent(_ product: KoinBillProduct) {
//        if let url = product.iconUrl, !url.isEmpty, let imageUrl = URL(string: url) {
//            iconImageView.load(url: imageUrl)
//        } else {
//            iconImageView.image = nil
//        }
//        titleLabel.text = product.name
//    }
}
