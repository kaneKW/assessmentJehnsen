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
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.orders.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: SettingCollectionViewCell.self), for: indexPath) as? SettingCollectionViewCell else {
            fatalError("wrong cell identifier")
        }
        let order = viewModel.orders[indexPath.row]
        cell.titleText = order.title
        
        if order == viewModel.selectedOrder {
            cell.setSelected()
        } else {
            cell.setUnselected()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.selectedOrder = viewModel.orders[indexPath.row]
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let view = collectionView.dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: String(describing: SettingCollectionHeaderView.self),
            for: indexPath) as? SettingCollectionHeaderView else {
                fatalError("Wrong Supplementary View")
            }
        view.setupContent(text: "Sort based on")
        return view
    }
}

extension SettingsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let item = viewModel.orders[indexPath.row].title
        let itemSize = item.size(withAttributes: [
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 20)
        ])
        return itemSize
    }
}
