//
//  MovieDetail.swift
//  SearchMovieSwiftUI
//
//  Created by Melike Sultan CAN on 12.02.2024.
//

import Foundation

struct MovieDetail : Codable {
    
    let title : String
    let year : String
    let genre : String
    let runtime : String
    let director : String
    let writer : String
    let actors : String
    let plot : String
    let language : String
    let awards : String
    let poster : String
    let country : String
    let imdbRating : String
    let imdbId : String
    
    private enum CodingKeys : String, CodingKey {
        case title = "Title"
        case year = "Year"
        case genre = "Genre"
        case runtime = "Runtime"
        case director = "Director"
        case writer = "Writer"
        case actors = "Actors"
        case plot = "Plot"
        case language = "Language"
        case awards = "Awards"
        case poster = "Poster"
        case country = "Country"
        case imdbRating = "imdbRating"
        case imdbId = "imdbID"
    }
    
}
