//
//  FavoriteMovieViewController.swift
//  cinetopia
//
//  Created by Luiz Carlos Goncalves Dos Anjos on 01/03/24.
//

import UIKit

class FavoriteMovieViewCell: UICollectionViewCell {

    // MARK: - UI components
    
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
        title.font = .systemFont(ofSize: 20, weight: .medium)
        title.textColor = .white
        title.textAlignment = .center
        title.numberOfLines = 1
        
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(imageView)
        addSubview(titleMovie)
        addSubview(favoriteButton)
        setupConstraints()
        
        /*setupView(Movie(
            id: "22",
            title: "Avengers",
            image: "https://raw.githubusercontent.com/alura-cursos/movie-api/main/images/vingadores-ultimato.jpg",
            synopsis: "",
            rate: 9.9,
            releaseDate: "")
        )
         */
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 140),
            
            titleMovie.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 12),
            titleMovie.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleMovie.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            favoriteButton.topAnchor.constraint(equalTo: titleMovie.bottomAnchor, constant: 7),
            favoriteButton.heightAnchor.constraint(equalToConstant: 25),
            favoriteButton.widthAnchor.constraint(equalToConstant: 25),
            favoriteButton.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    func setupView(_ movie: Movie) {
        imageView.kf.setImage(with: URL(string: movie.image))
        titleMovie.text = movie.title
    }
    
    @objc
    private func onClickFavoriteButton(_ sender: UIButton) {
        print("onclick favorite button")
    }

}

#Preview {
    FavoriteMovieViewCell()
}
