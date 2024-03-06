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
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()
    
    private lazy var coupleImgView: UIImageView = {
        let imgView = UIImageView(image: UIImage.couple)
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.contentMode = .scaleAspectFit
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
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.cornerRadius = 32
        
        button.addTarget(self, action: #selector(onButtonClick), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            logoImgView,
            coupleImgView,
            welcomeLabel,
            welcomeButton
        ])
        stack.translatesAutoresizingMaskIntoConstraints = false
        //stack.backgroundColor = .red
        stack.axis = .vertical
        //stack.distribution = .equalSpacing
        stack.spacing = 32
        stack.alignment = .center
        
        return stack
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .background
        //title = "Home"
        
        addViews()
        setupConstraints()
    }
    
    @objc private func onButtonClick() {
        print("on button clicked")
        navigationController?.pushViewController(TabBarViewController(), animated: true)
    }
    
    private func addViews() {
        view.addSubview(stackView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -64),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            welcomeLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 32),
            welcomeLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -32),
            
            welcomeButton.bottomAnchor.constraint(equalTo: stackView.bottomAnchor),
            welcomeButton.heightAnchor.constraint(equalToConstant: 64),
            welcomeButton.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 0.8)
            //welcomeButton.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 64),
            //welcomeButton.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -64),
        ])
    }
}

