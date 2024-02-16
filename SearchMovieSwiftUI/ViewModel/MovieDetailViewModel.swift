//
//  MovieDetailViewModel.swift
//  SearchMovieSwiftUI
//
//  Created by Melike Sultan CAN on 13.02.2024.
//

import Foundation
import SwiftUI

class MovieDetailViewModel : ObservableObject {
    
    @Published var movieDetails : MovieDetailsViewModel?
    
    let downloaderClient = DownloaderClient()
    
    func getMovieDetails(imdbId : String) {
        
        downloaderClient.downloadMovieDetails(imdbId: imdbId) { (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let movieDetail0):
                DispatchQueue.main.async {
                    self.movieDetails = MovieDetailsViewModel(detail: movieDetail0)
                }
                
            }
        }
        
    }
    
}

struct MovieDetailsViewModel {
    
    let detail : MovieDetail
    
    var title : String {
        detail.title
    }
    
    var poster : String {
        detail.poster
    }
    
    var year : String {
        detail.year
    }
    
    var imdbId : String {
        detail.imdbId
    }
    
    var director : String {
        detail.director
    }
    
    var writer : String {
        detail.writer
    }
    
    var awards : String {
        detail.awards
    }
    
    var plot : String {
        detail.plot
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

    var country : String {
        detail.country
    }
    var imdbRating : String {
        detail.imdbRating
    }

}
