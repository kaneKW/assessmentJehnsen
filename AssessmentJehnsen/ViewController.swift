//
//  ViewController.swift
//  AssessmentJehnsen
//
//  Created by Jehnsen Hirena Kane on 13/03/22.
//

import UIKit

class ViewController: UIViewController {
    lazy var tableView: UITableView = {
        let view = UITableView()
        view.backgroundColor = .clear
        view.sizeToFit()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupTableView()
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

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.accessoryType = .
        cell.textLabel?.text = "asdsdadsdadadas"
        return cell
    }
}

