//
//  MovieDetail.swift
//  SearchMovieSwiftUI
//
//  Created by Melike Sultan CAN on 12.02.2024.
//

import Foundation

struct MovieDetail: Codable {
    let title : String
    let year : String
    let country : String
    let genre : String
    let runtime : String
    let language : String
    let director : String
    let writer : String
    let actors : String
    let plot : String
    let awards : String
    let poster : String
    let metascore : String
    let imdbRating : String
    let imdbId : String
    
    
    private enum CodingKeys : String, CodingKey {
        case title = "Title"
        case year = "Year"
        case country = "Country"
        case genre = "Genre"
        case runtime = "Runtime"
        case language = "Language"
        case director = "Director"
        case writer = "Writer"
        case actors = "Actors"
        case plot = "Plot"
        case awards = "Awards"
        case poster = "Poster"
        case metascore = "Metascore"
        case imdbRating = "imdbRating"
        case imdbId = "imdbID"
    }
}
