//
//  FavoriteMovieViewController.swift
//  cinetopia
//
//  Created by Luiz Carlos Goncalves Dos Anjos on 01/03/24.
//

import UIKit

class FavoriteMovieViewController: UIViewController {

    // MARK: - UI components
    
    private lazy var mainView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        
        return view
    }()
    
    private lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 12
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        
        return image
    }()
    
    private lazy var titleMovie: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = .systemFont(ofSize: 18, weight: .medium)
        title.textColor = .black
        title.textAlignment = .center
        title.numberOfLines = 0
        
        return title
    }()
    
    private lazy var favoriteButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        let iconImage = UIImage(systemName: "heart.fill")?.withTintColor(.backgroundButton, renderingMode: .alwaysOriginal)
        button.setImage(iconImage, for: .normal)
        button.addTarget(self, action: #selector(onClickFavoriteButton), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray

        view.addSubview(mainView)
        view.addSubview(imageView)
        view.addSubview(titleMovie)
        view.addSubview(favoriteButton)
        
        setupConstraints()
        
        setupView(Movie(
            id: "", title: "Avatar",
            image: "https://github.com/giovannamoeller/movie-api/blob/main/images/avatar.jpg?raw=true",
            synopsis: "alfdakfa", rate: 9.8, releaseDate: "10/10/2030"
        ))
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            mainView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainView.widthAnchor.constraint(equalToConstant: 150),
            mainView.heightAnchor.constraint(equalToConstant: 200),
            
            imageView.topAnchor.constraint(equalTo: mainView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 140),
            
            titleMovie.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 12),
            titleMovie.leadingAnchor.constraint(equalTo: mainView.leadingAnchor),
            titleMovie.trailingAnchor.constraint(equalTo: mainView.trailingAnchor),
            
            favoriteButton.topAnchor.constraint(equalTo: titleMovie.bottomAnchor, constant: 7),
            favoriteButton.heightAnchor.constraint(equalToConstant: 25),
            favoriteButton.widthAnchor.constraint(equalToConstant: 25),
            favoriteButton.centerXAnchor.constraint(equalTo: mainView.centerXAnchor)
            
        ])
    }
    
    private func setupView(_ movie: Movie) {
        imageView.kf.setImage(with: URL(string: movie.image))
        titleMovie.text = movie.title
    }
    
    @objc
    private func onClickFavoriteButton(_ sender: UIButton) {
        print("onclick favorite button")
    }

}

#Preview {
    FavoriteMovieViewController()
}
