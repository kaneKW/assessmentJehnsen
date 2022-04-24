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
        navigationItem.title = "ini name"
        view.backgroundColor = .white
        view.addSubview(baseView)
        NSLayoutConstraint.activate([
            baseView.topAnchor.constraint(equalTo: view.topAnchor),
            baseView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            baseView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            baseView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        viewModel.onFinishFetchCoinDetail = didFinishFetchCoin
        viewModel.getCoinDetail()
    }
    
    private func didFinishFetchCoin(_ message: String?) {
        guard message == nil else {
            popupAlert(title: "Error", message: message ?? "Error")
            return
        }
        guard let data = viewModel.coinDetailData else {return}
        baseView.updateContent(data: data)
        DispatchQueue.main.async {
            self.navigationItem.title = data.name ?? "Coin"
        }
    }
}
