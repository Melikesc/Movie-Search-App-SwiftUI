//
//  Movie.swift
//  SearchMovieSwiftUI
//
//  Created by Melike Sultan CAN on 6.02.2024.
//

import Foundation

struct Movie : Codable {
    let title : String
    let year : String
    let imdbId : String
    let type : String
    let poster : String
    
    
    
    /*adlandırmada sorun yaşayabileceğimiz için çakışmaları önlemek istedik.
     bu sebeple gelen verileri kendi değişkenlerimize atadık*/
    private enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbId = "imdbID"
        case type = "Type"
        case poster = "Poster"
    }
}
struct gelenMovies : Codable {
    let movies : [Movie]
    
    private enum CodingKeys : String, CodingKey{
        case movies = "Search"
    }
}

