//
//  FavoritesMoviesViewController.swift
//  cinetopia
//
//  Created by Luiz Carlos Goncalves Dos Anjos on 01/03/24.
//

import UIKit

class FavoritesMoviesViewController: UIViewController {

    private let CELL_IDENTIFIER = "FavoriteMovieViewCell"
    private let HEADER_IDENTIFIER = "FavoriteHeaderCell"
    
    // MARK: - UI components
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        let collection = UICollectionView(frame: .zero,
                                          collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .clear
        collection.register(
            FavoriteMovieViewCell.self,
            forCellWithReuseIdentifier: CELL_IDENTIFIER
        )
        collection.register(
            FavoriteHeaderReusableView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: HEADER_IDENTIFIER
        )
        collection.dataSource = self
        collection.delegate = self
        
        return collection
    }()
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.setNavigationBarHidden(true, animated: true)
        view.backgroundColor = .background
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
        return 0 //myListMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CELL_IDENTIFIER, for: indexPath) as? FavoriteMovieViewCell else {
            fatalError("error to create favorite movie cell")
        }
        
        //cell.setupView(myListMovies[indexPath.item])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            guard let headerView = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind, withReuseIdentifier: HEADER_IDENTIFIER, for: indexPath) as? FavoriteHeaderReusableView else {
                fatalError("error to create favorite header")
            }
            
            headerView.setupTitle(title: "Meus filmes favoritos")
            
            return headerView
        }
        
        return UICollectionReusableView()
    }
}

extension FavoritesMoviesViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = 172//collectionView.frame.width / 3
        return CGSize(width: width, height: 210)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 50)
    }
    
}

#Preview {
    FavoritesMoviesViewController()
}
