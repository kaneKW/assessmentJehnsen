//
//  ViewController.swift
//  AssessmentJehnsen
//
//  Created by Jehnsen Hirena Kane on 13/03/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startButton.setTitle("start".localized(), for: .normal)
    }
    
    @IBAction func startPressed(_ sender: Any) {
        let vc = HomeViewController()
        let navigation = UINavigationController(rootViewController: vc)
        navigation.modalPresentationStyle = .overFullScreen
        present(navigation, animated: true, completion: nil)
    }
}
