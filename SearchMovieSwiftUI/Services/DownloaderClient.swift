//
//  HttpD.swift
//  SearchMovieSwiftUI
//
//  Created by Melike Sultan CAN on 6.02.2024.
//

import Foundation

class DownloaderClient {
    
    
    func downloadMovies(search: String, completion: @escaping (Result<[Movie]?,DownloaderError>) -> Void) {
        
        guard let url = URL(string: "https://www.omdbapi.com/?s=\(search)&apikey=(yourapikey)") else {
            return completion(.failure(.wrongURL))
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                return completion(.failure(.dataDidNotCome))
            }
            
            guard let movieResponse = try? JSONDecoder().decode(reachedMovies.self, from: data) else {
                return completion(.failure(.dataCouldNotProcessed))
            }
            
            completion(.success(movieResponse.movies)) 
            
        }.resume()
        
    }
    
    func downloadMovieDetails(imdbId : String, completion: @escaping (Result<MovieDetail,DownloaderError>) -> Void) {
        
        guard let url = URL(string: "https://www.omdbapi.com/?i=\(imdbId)&apikey=(yourapikey)") else {
            return completion(.failure(.wrongURL))
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                return completion(.failure(.dataDidNotCome))
            }
            
            guard let reachedMovieDetails = try? JSONDecoder().decode(MovieDetail.self, from: data) else { 
                return completion(.failure(.dataCouldNotProcessed))
            }
            
            completion(.success(reachedMovieDetails))
            
        }.resume()
        
    }
    
    
}

enum DownloaderError: Error {
    case wrongURL
    case dataDidNotCome
    case dataCouldNotProcessed
}
