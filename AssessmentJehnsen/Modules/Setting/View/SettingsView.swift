//
//  SettingsView.swift
//  AssessmentJehnsen
//
//  Created by Jehnsen Hirena Kane on 28/04/22.
//

import UIKit

class SettingsView: UIView {
    private lazy var customContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var grayLine: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var settingColView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
//        flowLayout.scrollDirection
        let view = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        view.register(SettingCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: SettingCollectionViewCell.self))
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var confirmContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var confirmButton: UIButton = {
        let view = UIButton()
        view.backgroundColor = .blue
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
        addSubview(customContainerView)
        customContainerView.addSubview(grayLine)
        customContainerView.addSubview(settingColView)
        customContainerView.addSubview(confirmContainerView)
        confirmContainerView.addSubview(confirmButton)
        
        NSLayoutConstraint.activate([
            customContainerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            customContainerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            customContainerView.bottomAnchor.constraint(equalTo: bottomAnchor),
//            customContainerView.topAnchor.constraint(equalTo: topAnchor)
//            customContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 2/3)
            customContainerView.heightAnchor.constraint(equalToConstant: 500)
        ])
        
        NSLayoutConstraint.activate([
            grayLine.topAnchor.constraint(equalTo: customContainerView.safeAreaLayoutGuide.topAnchor, constant: 24),
            grayLine.heightAnchor.constraint(equalToConstant: 3),
            grayLine.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 2/4),
            grayLine.centerXAnchor.constraint(equalTo: customContainerView.centerXAnchor),
        ])
        
        NSLayoutConstraint.activate([
            confirmContainerView.heightAnchor.constraint(equalToConstant: 100),
            confirmContainerView.leadingAnchor.constraint(equalTo: customContainerView.leadingAnchor),
            confirmContainerView.trailingAnchor.constraint(equalTo: customContainerView.trailingAnchor),
            confirmContainerView.bottomAnchor.constraint(equalTo: customContainerView.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
//            confirmButton.centerXAnchor.constraint(equalTo: confirmContainerView.centerXAnchor),
//            confirmButton.centerYAnchor.constraint(equalTo: confirmContainerView.centerYAnchor),
            confirmButton.topAnchor.constraint(equalTo: confirmContainerView.topAnchor, constant: 16),
            confirmButton.bottomAnchor.constraint(equalTo: confirmContainerView.bottomAnchor, constant: -32),
            confirmButton.leadingAnchor.constraint(equalTo: confirmContainerView.leadingAnchor, constant: 16),
            confirmButton.trailingAnchor.constraint(equalTo: confirmContainerView.trailingAnchor, constant: -16),
//            confirmButton.heightAnchor.constraint(equalToConstant: 52)
        ])
        
        NSLayoutConstraint.activate([
            settingColView.leadingAnchor.constraint(equalTo: customContainerView.leadingAnchor),
            settingColView.trailingAnchor.constraint(equalTo: customContainerView.trailingAnchor),
            settingColView.topAnchor.constraint(equalTo: grayLine.bottomAnchor, constant: 16),
            settingColView.bottomAnchor.constraint(equalTo: confirmContainerView.topAnchor)
        ])
    }
}
