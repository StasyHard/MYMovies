//
//  NetworkServise.swift
//  MYMovies
//
//  Created by Anastasia Reyngardt on 16.04.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import Foundation

//получает от Data запросы на поход в сеть
protocol NetworkServiseProtocol {
    func findMovies(completion: @escaping ([Movie?]) -> Void)
}

class NetworkServise: NetworkServiseProtocol {
    private let path = "https://api.themoviedb.org"
    private let apiKey = MyTMDBApiKey
    
    func findMovies(completion: @escaping ([Movie?]) -> Void) {
        guard var urlComponents = URLComponents(string: path + "/3/search/movie")
            else { return }
        urlComponents.queryItems = [
            URLQueryItem(name: "api_key", value: apiKey),
            URLQueryItem(name: "language", value: "ru"),
            URLQueryItem(name: "query", value: "Викинги") ]
        guard let url = urlComponents.url
            else { return }
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            do {
                guard let data = data,
                    let response = response as? HTTPURLResponse,
                    (200 ..< 300) ~= response.statusCode,
                    error == nil else {
                        print(error!)
                        return
                }
                let moviesResponse = try JSONDecoder().decode(MoviesResponse.self, from: data)
                var movies = [Movie]()
                moviesResponse.results.forEach { movies.append($0.mapToMovie()) }
                completion(movies)
            } catch {
                print(error.localizedDescription)
            }
            
        }
        task.resume()
    }
    
    
}
