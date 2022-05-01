//
//  DetailViewController.swift
//  AssessmentJehnsen
//
//  Created by Jehnsen Hirena Kane on 24/04/22.
//

import UIKit

class DetailViewController: UIViewController {
    lazy var baseView: DetailView = {
        let view = DetailView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var indicatorView: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let viewModel: DetailViewModel
    
    init(viewModel: DetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupFunctionality()
        indicatorView.startAnimating()
        viewModel.getCoinDetail()
    }
    
    private func setupLayout() {
        view.backgroundColor = .white
        view.addSubview(baseView)
        view.addSubview(indicatorView)
        NSLayoutConstraint.activate([
            baseView.topAnchor.constraint(equalTo: view.topAnchor),
            baseView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            baseView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            baseView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        NSLayoutConstraint.activate([
            indicatorView.topAnchor.constraint(equalTo: view.topAnchor),
            indicatorView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            indicatorView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            indicatorView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    private func setupFunctionality() {
        viewModel.onFinishFetchCoinDetail = didFinishFetchCoin
    }
    
    private func didFinishFetchCoin(_ message: String?) {
        DispatchQueue.main.async {
            self.indicatorView.stopAnimating()
            guard message == nil else {
                self.popupAlert(title: "Error", message: message ?? "Error")
                return
            }
            guard let data = self.viewModel.coinDetailData else {return}
            
            self.baseView.data = data
            self.navigationItem.title = data.name ?? "Coin"
        }
    }
}
