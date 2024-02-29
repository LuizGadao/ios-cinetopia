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
    
    func getMovies(onComplete: @escaping (Result<[Movie], MovieServiceError>) -> Void) {
        
        
        let urlStr = "http://localhost:3000/movies"
        guard let url = URL(string: urlStr) else {
            onComplete(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            //print("data: \(String(describing: data))")
            //print("response: \(String(describing: response))")
            //print("error: \(String(describing: error))")
            
            guard let data = data,
                  let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200
                    else {
                        onComplete(.failure(.invalidResponse))
                        return
                    }
            do {
                let movies = try JSONDecoder().decode([Movie].self, from: data)
                //print(movies)
                onComplete(.success(movies))
            } catch (let error) {
                onComplete(.failure(.invalidJson))
                print("error-parse-json: \(error)")
            }
        }
        
        task.resume()
    }
    
}
