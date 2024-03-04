//
//  FavoritesMoviesViewController.swift
//  cinetopia
//
//  Created by Luiz Carlos Goncalves Dos Anjos on 01/03/24.
//

import UIKit

class FavoritesMoviesViewController: UIViewController {

    private let CELL_IDENTIFIER = "FavoriteMovieViewCell"
    
    // MARK: - UI components
    
    private lazy var collectionView: UICollectionView = {
        let collection = UICollectionView(frame: .zero,
                                          collectionViewLayout: UICollectionViewFlowLayout())
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .yellow
        collection.register(
            FavoriteMovieViewCell.self,
            forCellWithReuseIdentifier: CELL_IDENTIFIER
        )
        collection.dataSource = self

        
        return collection
    }()
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(collectionView)
        setupConstraints()
    }
    
    // MARK: - methods
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

}

extension FavoritesMoviesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myListMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CELL_IDENTIFIER, for: indexPath) as? FavoriteMovieViewCell else {
            fatalError("error to create favorite movie cell")
        }
        
        cell.setupView(myListMovies[indexPath.item])
        
        return cell
    }
}

#Preview {
    FavoritesMoviesViewController()
}
