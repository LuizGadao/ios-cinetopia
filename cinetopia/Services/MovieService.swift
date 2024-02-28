//
//  MovieService.swift
//  cinetopia
//
//  Created by Luiz Carlos Goncalves Dos Anjos on 28/02/24.
//

import Foundation


struct MovieService {
    
    func loadMovies() {
        let urlStr = "http://localhost:3000/movies"
        guard let url = URL(string: urlStr) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            print("data: \(data)")
            print("response: \(response)")
            print("error: \(error)")
            
            guard let data = data,
                  let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200
                    else {
                        return
                    }
            
            do {
                let movies = try JSONDecoder().decode([Movie].self, from: data)
                print(movies)
            } catch (let error) {
                print("error-parse-json: \(error)")
            }
        }
        
        task.resume()
    }
    
}
