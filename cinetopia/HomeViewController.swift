//
//  ViewController.swift
//  cinetopia
//
//  Created by Luiz Carlos Goncalves Dos Anjos on 21/02/24.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .background
        
        let label = UILabel()
        label.text = "Hello Gadão"
        label.textColor = .white
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        view.addSubview(label)
    }
}

