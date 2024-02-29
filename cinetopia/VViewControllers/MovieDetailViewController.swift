//
//  MovieDetailViewController.swift
//  cinetopia
//
//  Created by Luiz Carlos Goncalves Dos Anjos on 27/02/24.
//

import UIKit
import Kingfisher

class MovieDetailViewController: UIViewController {
    
    var movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var image: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 32
        image.layer.masksToBounds = true
        
        
        return image
    }()
    
    private lazy var star: UIImageView = {
        let image = UIImageView(image: UIImage.star1)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        
        return image
    }()
    
    private lazy var titleLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 28.0, weight: .bold)
        label.textColor = .white
        label.numberOfLines = 0
        
        return label
    }()
    
    private lazy var infoLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16.0)
        //label.font = .italicSystemFont(ofSize: 16)
        label.textColor = .white
        label.numberOfLines = 0
        
        return label
    }()
    
    private lazy var rateLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16.0, weight: .bold)
        label.textColor = .white
        label.numberOfLines = 0
        
        return label
    }()
    
    private lazy var synopisisLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16.0)
        label.textColor = .white
        label.numberOfLines = 0
        
        return label
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        //title = movie.title
        
        navigationController?.navigationBar.prefersLargeTitles = false
        addViews()
        setupConstraints()
        
        image.kf.setImage(with: URL(string: movie.image))
        titleLabel.text = movie.title
        rateLabel.text = movie.rate.description
        infoLabel.text = "Lançamento: \(movie.releaseDate)"
        synopisisLabel.text = movie.synopsis
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    private func addViews() {
        view.addSubview(image)
        view.addSubview(titleLabel)
        view.addSubview(infoLabel)
        view.addSubview(synopisisLabel)
        view.addSubview(star)
        view.addSubview(rateLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            image.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            image.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            image.heightAnchor.constraint(equalToConstant: 260),
            
            titleLabel.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -48),
            
            star.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 16),
            star.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -48),
            star.widthAnchor.constraint(equalToConstant: 22.0),
            star.heightAnchor.constraint(equalToConstant: 22.0),
            
            rateLabel.topAnchor.constraint(equalTo: star.topAnchor, constant: 2),
            rateLabel.leadingAnchor.constraint(equalTo: star.trailingAnchor, constant: 6),
            
            infoLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            infoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            infoLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            synopisisLabel.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 16),
            synopisisLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            synopisisLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])
    }
    

}
