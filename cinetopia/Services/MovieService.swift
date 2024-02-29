//
//  MovieService.swift
//  cinetopia
//
//  Created by Luiz Carlos Goncalves Dos Anjos on 28/02/24.
//

import Foundation


enum MovieServiceError: Error {
    case invalidURL
    case invalidResponse
    case invalidJson
}

struct MovieService {
    
    func getMovies() async throws -> [Movie] {
        let urlStr = "http://localhost:3000/movies"
        guard let url = URL(string: urlStr) else {
            throw MovieServiceError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw MovieServiceError.invalidResponse
        }
        
        do {
            let movies = try JSONDecoder().decode([Movie].self, from: data)
            return movies
        } catch {
            throw MovieServiceError.invalidJson
        }
    }
    
}
