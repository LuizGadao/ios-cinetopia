//
//  MovieService.swift
//  cinetopia
//
//  Created by Luiz Carlos Goncalves Dos Anjos on 28/02/24.
//

import Foundation


struct MovieService {
    
    func getMovies(onComplete: @escaping ([Movie]?) -> Void) {
        var movies: [Movie] = []
        
        let urlStr = "http://localhost:3000/movies"
        guard let url = URL(string: urlStr) else {
            onComplete(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            //print("data: \(String(describing: data))")
            //print("response: \(String(describing: response))")
            //print("error: \(String(describing: error))")
            
            guard let data = data,
                  let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200
                    else {
                        onComplete(nil)
                        return
                    }
            do {
                movies = try JSONDecoder().decode([Movie].self, from: data)
                //print(movies)
                onComplete(movies)
            } catch (let error) {
                print("error-parse-json: \(error)")
            }
        }
        
        task.resume()
    }
    
}
