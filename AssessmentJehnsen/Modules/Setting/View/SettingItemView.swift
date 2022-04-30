//
//  SettingItemView.swift
//  AssessmentJehnsen
//
//  Created by Jehnsen Hirena Kane on 29/04/22.
//

import UIKit

class SettingItemView: UIView {
    lazy var labelContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = false
        return view
    }()

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "asdasdasdas"
        label.font = .systemFont(ofSize: 16)
        label.textAlignment = .center
        label.numberOfLines = 1
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        translatesAutoresizingMaskIntoConstraints = false
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = .white
        
        layer.cornerRadius = 10
        labelContainerView.layer.cornerRadius = 10
    }

    private func setupLayout() {
        addSubview(labelContainerView)
        NSLayoutConstraint.activate([
            labelContainerView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            labelContainerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            labelContainerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            labelContainerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
        ])
        
        labelContainerView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: labelContainerView.topAnchor, constant: 4),
            titleLabel.bottomAnchor.constraint(equalTo: labelContainerView.bottomAnchor, constant: -4),
            titleLabel.leadingAnchor.constraint(equalTo: labelContainerView.leadingAnchor, constant: 4),
            titleLabel.trailingAnchor.constraint(equalTo: labelContainerView.trailingAnchor, constant: -4),
        ])
    }
}
