//
//  SettingsViewController.swift
//  AssessmentJehnsen
//
//  Created by Jehnsen Hirena Kane on 28/04/22.
//

import UIKit

class SettingsViewController: UIViewController {
    
    private lazy var contentView: SettingsView = {
        let view = SettingsView()
        view.settingColView.delegate = self
        view.settingColView.dataSource = self
        view.onTapShadowView = dismissViewController
        view.onTapConfirm = handleConfirm
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var viewModel: SettingViewModel = {
        let viewModel = SettingViewModel()
        return viewModel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    var didFinishConfigureSettings: ((_ order: CoinOrder?) -> Void)?
    private func handleConfirm() {
        Constant.shared.saveLanguage(language: viewModel.selectedLanguage)
        didFinishConfigureSettings?(viewModel.selectedOrder)
        self.dismiss(animated: true, completion: nil)
    }
    
    private func dismissViewController() {
        self.dismiss(animated: true, completion: nil)
    }
    
    private func setupLayout() {
        view.backgroundColor = .clear
        view.addSubview(contentView)
        contentView.layer.cornerRadius = 10
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        
    }

}

extension SettingsViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return viewModel.orders.count
        } else {
            return viewModel.supportedLanguages.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: SettingCollectionViewCell.self), for: indexPath) as? SettingCollectionViewCell else {
            fatalError("wrong cell identifier")
        }
        if indexPath.section == 0 {
            let order = viewModel.orders[indexPath.row]
            cell.titleText = order.title
            if order == viewModel.selectedOrder {
                cell.setSelected()
            } else {
                cell.setUnselected()
            }
        } else {
            let language = viewModel.supportedLanguages[indexPath.row]
            cell.titleText = language == "en" ? "English" : "Indonesia"
            if language == viewModel.selectedLanguage {
                cell.setSelected()
            } else {
                cell.setUnselected()
            }
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            viewModel.selectedOrder = viewModel.orders[indexPath.row]
        } else {
            viewModel.selectedLanguage = viewModel.supportedLanguages[indexPath.row]
        }
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let view = collectionView.dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: String(describing: SettingCollectionHeaderView.self),
            for: indexPath) as? SettingCollectionHeaderView else {
                fatalError("Wrong Supplementary View")
            }
        if indexPath.section == 0 {
            view.setupContent(text: "sort_based_on".localized())
        } else {
            view.setupContent(text: "language".localized())
        }
        
        return view
    }
}

extension SettingsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var item = String()
        if indexPath.section == 0 {
            item = viewModel.orders[indexPath.row].title
        } else {
            let language = viewModel.supportedLanguages[indexPath.row]
            item = language == "en" ? "English" : "Indonesia"
        }
        
        let itemSize = item.size(withAttributes: [
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 20)
        ])
        return itemSize
    }
}
