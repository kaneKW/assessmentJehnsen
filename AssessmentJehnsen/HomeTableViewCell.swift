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
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var symbolLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var currentPriceLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var priceChangeLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    func setupView() {
        addSubview(iconImage)
        addSubview(nameLabel)
        addSubview(symbolLabel)
        addSubview(currentPriceLabel)
        addSubview(priceChangeLabel)
        
        NSLayoutConstraint.activate([
            iconImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            iconImage.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0),
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
