//
//  MovieManager.swift
//  cinetopia
//
//  Created by Luiz Carlos Goncalves Dos Anjos on 06/03/24.
//

import Foundation

class MovieManager {
    
    static let movieManager = MovieManager()
    var favoritesMovies: [Movie] = []
    
    private init() { }
    
    func add(_ movie: Movie) {
        if favoritesMovies.contains(where: { $0.id == movie.id }) {
            remove(movie)
        } else {
            favoritesMovies.append(movie)
        }
    }
    
    func remove(_ movie: Movie) {
        if let index = favoritesMovies.firstIndex(where: { $0.id == movie.id }) {
            favoritesMovies.remove(at: index)
        }
    }
    
}
