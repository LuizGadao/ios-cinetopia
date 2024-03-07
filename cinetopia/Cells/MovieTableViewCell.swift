//
//  MovieTableViewCell.swift
//  cinetopia
//
//  Created by Luiz Carlos Goncalves Dos Anjos on 24/02/24.
//

import UIKit
import Kingfisher

class MovieTableViewCell: UITableViewCell {

    private lazy var posterImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 12
        image.layer.masksToBounds = true
        image.layer.borderColor = UIColor.white.cgColor
        image.layer.borderWidth = 1
        return image
    } ()
    
    private lazy var titleLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18.0, weight: .bold)
        label.textColor = .white
        label.numberOfLines = 0
        label.text = "My title here..."
        
        return label
    }()
    
    private lazy var releaseDateLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16.0)
        label.textColor = .white.withAlphaComponent(0.75)
        label.text = "10/10/2099"
        
        return label
    }()
    
    private lazy var favoriteButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        let icon =  UIImage(systemName: "heart")?.withTintColor(.red, renderingMode: .alwaysOriginal)
        button.setImage(icon, for: .normal)
        button.addTarget(self, action: #selector(onClickFavorite), for: .touchUpInside)
        
        return button
    }()
    
    func setupCell(movie: Movie) {
        titleLabel.text = movie.title
        posterImage.kf.setImage(with: URL(string: movie.image))
        releaseDateLabel.text = "Lançamento: \(movie.releaseDate)"
        
        let heart = "heart"
        let heartFill = "heartFill"
        
        let icon = UIImage(systemName: movie.isSelected == true ? heartFill : heart)?
            .withTintColor(.red, renderingMode: .alwaysOriginal)
        favoriteButton.setImage(icon, for: .normal)
    }
    
    private func addSubvies() {
        addSubview(posterImage)
        addSubview(titleLabel)
        addSubview(releaseDateLabel)
        //addSubview(favoriteButton)
        contentView.addSubview(favoriteButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            posterImage.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            posterImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            posterImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            posterImage.widthAnchor.constraint(equalToConstant: 100),
            
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -16),
            titleLabel.leadingAnchor.constraint(equalTo: posterImage.trailingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            releaseDateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            releaseDateLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: 0),
            
            favoriteButton.topAnchor.constraint(equalTo: releaseDateLabel.bottomAnchor, constant: 8),
            favoriteButton.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            favoriteButton.heightAnchor.constraint(equalToConstant: 25),
            favoriteButton.widthAnchor.constraint(equalToConstant: 25),
        ])
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubvies()
        setupConstraints()
        backgroundColor = .background
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @objc
    func onClickFavorite(sender: UIButton) {
        print("favorite click")
    }

}


 #Preview {
     MovieTableViewCell()
 }
 
