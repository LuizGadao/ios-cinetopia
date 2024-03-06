//
//  TabBarViewController.swift
//  cinetopia
//
//  Created by Luiz Carlos Goncalves Dos Anjos on 05/03/24.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    private func setupTabBar() {
        styleTabBar()
        navigationItem.hidesBackButton = true
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        let home = UINavigationController(rootViewController: MoviesViewController())
        let symbomConfig = UIImage.SymbolConfiguration(scale: .medium)
        
        let homeSymbol = UIImage(systemName: "film", withConfiguration: symbomConfig)
        home.tabBarItem.image = homeSymbol
        home.tabBarItem.title = "Filmes populares"
        
        let favorite = UINavigationController(rootViewController: FavoritesMoviesViewController())
        let favoriteSymbol = UIImage(systemName: "heart", withConfiguration: symbomConfig)
        favorite.tabBarItem.image = favoriteSymbol
        favorite.tabBarItem.title = "Favoritos"
        
        self.setViewControllers([home, favorite], animated: true)
    }
    
    private func styleTabBar() {
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = UIColor(.background)
        
        let tabAppearance = UITabBar.appearance()
        tabAppearance.scrollEdgeAppearance = appearance
        tabAppearance.standardAppearance = appearance
    }

}
