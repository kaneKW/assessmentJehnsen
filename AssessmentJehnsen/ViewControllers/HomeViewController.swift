//
//  HomeViewController.swift
//  AssessmentJehnsen
//
//  Created by Jehnsen Hirena Kane on 24/04/22.
//

import UIKit

class HomeViewController: UIViewController {
    lazy var tableView: UITableView = {
        let view = UITableView()
        view.backgroundColor = .clear
        view.rowHeight = 100
        view.register(HomeTableViewCell.self, forCellReuseIdentifier: String(describing: HomeTableViewCell.self))
        view.prefetchDataSource = self
        view.delegate = self
        view.dataSource = self
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var viewModel: HomeViewModel = {
        let viewModel = HomeViewModel(service: CoinService())
        viewModel.onFinishFetchCoin = didFinishFetchCoin
        return viewModel
    }()
    
    lazy var indicatorView: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        setupView()
        indicatorView.startAnimating()
        viewModel.fetchCoins()
    }
    
    private func setupNavBar() {
        navigationItem.title = "Coins"
        let sortingButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(filterTapped))
        let sortingbUtton = UIBarButtonItem(
//        let play = UIBarButtonItem(title: "Play", style: .plain, target: self, action: #selector(playTapped))

//        navigationItem.rightBarButtonItems = [add, play]
    }
    
    private func filterTapped() {
        
    }
    
    private func didFinishFetchCoin(_ message: String?) {
        DispatchQueue.main.async {
            self.indicatorView.stopAnimating()
        }
        
        guard message == nil else {
            popupAlert(title: "Error", message: message ?? "Error")
            return
        }
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func setupView() {
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            //vertical
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            
            //horizontal
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
        ])
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.coinData.count + 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: HomeTableViewCell.self)) as? HomeTableViewCell else {
            fatalError(
                "Couldn't find UITableViewCell for \(String(describing: HomeTableViewCell.self)), make sure the cell is registered with table view")
        }
        if isLoadingCell(for: indexPath) {
            cell.backgroundColor = .red
        } else {
            cell.setupContent(data: viewModel.coinData[indexPath.row])
            cell.backgroundColor = .white
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let coin = viewModel.coinData[indexPath.row]
        guard let coinId = coin.idLabel else {
            return
        }
        let vm = DetailViewModel(service: CoinService(), coinId: coinId)
        let vc = DetailViewController(viewModel: vm)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension HomeViewController: UITableViewDataSourcePrefetching {
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        if indexPaths.contains(where: isLoadingCell) {
            viewModel.fetchCoins()
        }
    }
}

extension HomeViewController {
    func isLoadingCell(for indexPath: IndexPath) -> Bool {
        return indexPath.row >= viewModel.currentCount
    }
    
    func visibleIndexPathsToReload(intersecting indexPaths: [IndexPath]) -> [IndexPath] {
        let indexPathsForVisibleRows = tableView.indexPathsForVisibleRows ?? []
        let indexPathsIntersection = Set(indexPathsForVisibleRows).intersection(indexPaths)
        return Array(indexPathsIntersection)
    }
}


extension HomeViewController {
    func onFetchCompleted(with newIndexPathsToReload: [IndexPath]?) {
        // 1
        guard let newIndexPathsToReload = newIndexPathsToReload else {
            indicatorView.stopAnimating()
            tableView.isHidden = false
            tableView.reloadData()
            return
        }
        // 2
        let indexPathsToReload = visibleIndexPathsToReload(intersecting: newIndexPathsToReload)
        tableView.reloadRows(at: indexPathsToReload, with: .automatic)
    }
}
