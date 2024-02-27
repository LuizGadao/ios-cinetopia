//
//  MovieTableViewCell.swift
//  cinetopia
//
//  Created by Luiz Carlos Goncalves Dos Anjos on 24/02/24.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    private lazy var posterImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 12
        image.layer.masksToBounds = true
        return image
    } ()
    
    private lazy var titleLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20.0, weight: .bold)
        label.textColor = .white
        label.numberOfLines = 0
        label.text = "My title here..."
        
        return label
    }()
    
    private lazy var releaseDateLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18.0)
        label.textColor = .white.withAlphaComponent(0.75)
        label.text = "10/10/2099"
        
        return label
    }()
    
    func setupCell(movie: Movie) {
        titleLabel.text = movie.title
        posterImage.image = UIImage(named: movie.image)
        releaseDateLabel.text = "Lançamento: \(movie.releaseDate)"
    }
    
    private func addSubvies() {
        addSubview(posterImage)
        addSubview(titleLabel)
        addSubview(releaseDateLabel)
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
            releaseDateLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: 0)
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

}

#Preview {
    MovieTableViewCell()
}
