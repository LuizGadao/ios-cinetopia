//
//  ViewController.swift
//  cinetopia
//
//  Created by Luiz Carlos Goncalves Dos Anjos on 21/02/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    private lazy var logoImgView: UIImageView = {
        let imgView = UIImageView(image: UIImage.logo)
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    private lazy var coupleImgView: UIImageView = {
        let imgView = UIImageView(image: UIImage.couple)
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    private lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "O lugar ideal para buscar, salvar e organizar seus filmes favoritos!"
        label.textColor = .white
        label.font = .systemFont(ofSize: 20)
        label.numberOfLines = 0
        label.textAlignment = .center
        
        return label
    }()
    
    private lazy var welcomeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints =  false
        button.setTitle("Quero comerçar", for: .normal)
        button.setTitleColor(.background, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.backgroundColor = .backgroundButton
        button.layer.cornerRadius = 32
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .background
        
        addViews()
        setupConstraints()
    }
    
    private func addViews() {
        view.addSubview(logoImgView)
        view.addSubview(coupleImgView)
        view.addSubview(welcomeLabel)
        view.addSubview(welcomeButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            logoImgView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 64
            ),
            logoImgView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            coupleImgView.topAnchor.constraint(equalTo: logoImgView.bottomAnchor, constant: 32),
            coupleImgView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            welcomeLabel.topAnchor.constraint(equalTo: coupleImgView.bottomAnchor, constant: 16),
            welcomeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            welcomeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            welcomeButton.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 32),
            welcomeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -64),
            welcomeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 64),
            welcomeButton.heightAnchor.constraint(equalToConstant: 64)
        
        ])
    }
}

