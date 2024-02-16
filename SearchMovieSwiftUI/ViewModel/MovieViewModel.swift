//
//  MovieViewModel.swift
//  SearchMovieSwiftUI
//
//  Created by Melike Sultan CAN on 12.02.2024.
//

import Foundation
import SwiftUI

class MovieListViewModel : ObservableObject {
    
    @Published var movies = [MovieViewModel]()
    
    let downloaderClient = DownloaderClient()
    
    func searchMovie(movieName : String) {
        downloaderClient.downloadMovies(search: movieName) { (result) in
            switch result {
                case.failure(let error):
                    print(error)
                case .success(let movielist):
                    if let movielist = movielist {
                        DispatchQueue.main.async {
                            self.movies = movielist.map(MovieViewModel.init)
                        }
                    }
            }
        }
    }
}

struct MovieViewModel {
    
    let movie : Movie
    
    var title : String {
        movie.title
    }
    
    var poster : String {
        movie.poster
    }
    
    var year : String {
        movie.year
    }
    
    var imdbId : String {
        movie.imdbId
    }
    
}
