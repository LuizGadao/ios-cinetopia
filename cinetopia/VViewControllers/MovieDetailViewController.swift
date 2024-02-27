//
//  MovieDetailViewController.swift
//  cinetopia
//
//  Created by Luiz Carlos Goncalves Dos Anjos on 27/02/24.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    var movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        title = movie.title
    }

}
