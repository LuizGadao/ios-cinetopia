//
//  MovieTableViewCell.swift
//  cinetopia
//
//  Created by Luiz Carlos Goncalves Dos Anjos on 24/02/24.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    private lazy var posterImage: UIImageView = {
        let image = UIImageView(image: UIImage.avengers)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = 12
        return image
    } ()
    
    private func addSubvies() {
        addSubview(posterImage)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            posterImage.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            posterImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            posterImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 16)
        ])
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubvies()
        setupConstraints()
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
