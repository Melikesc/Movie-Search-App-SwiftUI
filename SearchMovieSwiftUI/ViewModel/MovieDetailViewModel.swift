//
//  MovieDetailViewModel.swift
//  SearchMovieSwiftUI
//
//  Created by Melike Sultan CAN on 13.02.2024.
//

import Foundation
import SwiftUI


class MovieDetailViewModel : ObservableObject {
    
    @Published var movieDetails :  MovieDetailsViewModel?
    
    let downloaderClient = DownloaderClient()
    
    func getMovieDetail (imdbId: String) {
        
        downloaderClient.downloadMovieDetail(imdbId: imdbId) { (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let movieDetail):
                DispatchQueue.main.async {
                    self.movieDetails = MovieDetailsViewModel(detail: movieDetail)
                }
                        self.movieDetails = MovieDetailsViewModel(detail: movieDetail)
                    }
                }
            }
        }


struct MovieDetailsViewModel {
    
    let detail :  MovieDetail
    
    
    var title : String {
        detail.title
    }
    var year : String {
        detail.year
    }
    var country : String {
        detail.country
    }
    var genre : String {
        detail.genre
    }
    var runtime : String {
        detail.runtime
    }
    var language : String {
        detail.language
    }
    var director : String {
        detail.director
    }
    var writer : String {
        detail.writer
    }
    var actors : String {
        detail.actors
    }
    var plot : String {
        detail.plot
    }
    var awards : String {
        detail.awards
    }
    var poster : String {
        detail.poster
    }
    var metascore : String {
        detail.metascore
    }
    var imdbId : String {
        detail.imdbId
    }
    var imdbRating : String {
        detail.imdbRating
    }
    
}


