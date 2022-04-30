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
        guard viewModel.selectedIndex != 99 else {
            return
        }
        didFinishConfigureSettings?(viewModel.orderSettings[viewModel.selectedIndex])
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
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.orderSettings.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: SettingCollectionViewCell.self), for: indexPath) as? SettingCollectionViewCell else {
            fatalError("wrong cell identifier")
        }
        cell.titleText = viewModel.orderSettings[indexPath.row].title
        if indexPath.row == viewModel.selectedIndex {
            cell.setSelected()
        } else {
            cell.setUnselected()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.selectedIndex = indexPath.row
        collectionView.reloadData()
    }
}

extension SettingsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let item = viewModel.orderSettings[indexPath.row].rawValue
        let itemSize = item.size(withAttributes: [
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 20)
        ])
        return itemSize
    }
}
