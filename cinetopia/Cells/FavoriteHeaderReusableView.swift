//
//  FavoriteHeaderReusableView.swift
//  cinetopia
//
//  Created by Luiz Carlos Goncalves Dos Anjos on 04/03/24.
//

import UIKit

class FavoriteHeaderReusableView: UICollectionReusableView {
    
    // MARK: UI Components
    
    private lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 28.0, weight: .medium)
        label.textColor = .white
        label.textAlignment = .left
        
        return label
    }()
    
    // MARK: init methods
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(headerLabel)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Class methods
    
    func setupTitle(title: String) {
        headerLabel.text = title
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: topAnchor),
            headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            headerLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
        
}
