//
//  ViewController.swift
//  cinetopia
//
//  Created by Luiz Carlos Goncalves Dos Anjos on 21/02/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    private lazy var helloLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Hello Gadão"
        label.textColor = .white
        ///label.backgroundColor = .red
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.red.cgColor
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 24, weight: .bold)
        
        return label
    }()
    
    private lazy var brazilLabel: UILabel = {
        let brazil = UILabel()
        brazil.translatesAutoresizingMaskIntoConstraints = false
        brazil.text = "Brasil 🇧🇷🇧🇷🇧🇷"
        brazil.textColor = .white
        brazil.textAlignment = .center
        brazil.font = .systemFont(ofSize: 28, weight: .bold)
        brazil.layer.borderWidth = 2
        brazil.layer.borderColor = UIColor.white.cgColor
        
        return brazil
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .background
        
        addViews()
        setupConstraints()
    }
    
    private func addViews() {
        view.addSubview(helloLabel)
        view.addSubview(brazilLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            //center in view parent
            helloLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            helloLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            //top of the parent
            //label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            
            //bottom of the parent
            //label.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 16),
            
            //right of the parent
            //label.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            
            // left of the prent for this you need to declare negative constant "margin"
            //label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32)
            //label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            
            //define width and height
            //label.widthAnchor.constraint(equalToConstant: 100),
            //label.heightAnchor.constraint(equalToConstant: 50)
            
            //define width and height with % "multiplier"
            helloLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4),
            helloLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1),
            
            brazilLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            brazilLabel.heightAnchor.constraint(equalToConstant: 100),
            brazilLabel.topAnchor.constraint(equalTo: helloLabel.bottomAnchor, constant: 16),
            //brazil.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            brazilLabel.centerXAnchor.constraint(equalTo: helloLabel.centerXAnchor)
        ])
    }
}

