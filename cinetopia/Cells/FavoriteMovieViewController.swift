//
//  FavoriteMovieViewController.swift
//  cinetopia
//
//  Created by Luiz Carlos Goncalves Dos Anjos on 01/03/24.
//

import UIKit

class FavoriteMovieViewController: UIViewController {

    // MARK: - UI components
    
    private let mainView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray

        view.addSubview(mainView)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            mainView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainView.widthAnchor.constraint(equalToConstant: 150),
            mainView.heightAnchor.constraint(equalToConstant: 200),
        ])
    }

}

#Preview {
    FavoriteMovieViewController()
}
