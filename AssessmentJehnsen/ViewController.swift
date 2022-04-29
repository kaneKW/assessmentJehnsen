//
//  ViewController.swift
//  AssessmentJehnsen
//
//  Created by Jehnsen Hirena Kane on 13/03/22.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func startPressed(_ sender: Any) {
//        let vm = DetailViewModel(service: CoinService(), coinId: "bitcoin")
//        let vc = DetailViewController(viewModel: vm)
        let vc = HomeViewController()
        let navigation = UINavigationController(rootViewController: vc)
        navigation.modalPresentationStyle = .overFullScreen
        present(navigation, animated: true, completion: nil)
    }
}
