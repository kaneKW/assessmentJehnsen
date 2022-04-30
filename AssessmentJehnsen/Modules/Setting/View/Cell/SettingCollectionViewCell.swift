//
//  SettingCollectionViewCell.swift
//  AssessmentJehnsen
//
//  Created by Jehnsen Hirena Kane on 29/04/22.
//

import UIKit

class SettingCollectionViewCell: UICollectionViewCell {
    private lazy var itemView: SettingItemView = {
        let view = SettingItemView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var titleText: String? {
        didSet {
            itemView.titleLabel.text = titleText
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        isUserInteractionEnabled = true
        translatesAutoresizingMaskIntoConstraints = false
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupLayout() {
        addSubview(itemView)
        NSLayoutConstraint.activate([
            itemView.topAnchor.constraint(equalTo: contentView.topAnchor),
            itemView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            itemView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            itemView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }
    
    func setSelected() {
        itemView.labelContainerView.layer.borderColor = UIColor.green.cgColor
    }
    
    func setUnselected() {
        itemView.labelContainerView.layer.borderColor = UIColor.lightGray.cgColor
    }
}
