//
//  DetailView.swift
//  SearchMovieSwiftUI
//
//  Created by Melike Sultan CAN on 13.02.2024.
//

import SwiftUI

struct DetailView: View {
    
    let imdbId : String
    
    @ObservedObject var movieDetailViewModel = MovieDetailViewModel()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            
            HStack{
                Spacer()
                SpecImage(url: movieDetailViewModel.movieDetails?.poster ?? "")
                    .frame(width: UIScreen.main.bounds.width * 0.6,
                           height: UIScreen.main.bounds.height * 0.3, alignment: .center)
                Spacer()
            }
            
            
            Text(movieDetailViewModel.movieDetails?.title ?? "movie name")
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).padding()
            Text("Yönetmen: \(movieDetailViewModel.movieDetails?.plot ?? "plot")")
                .padding()
            Text("Yönetmen:\(movieDetailViewModel.movieDetails?.director ?? "director")")
                .padding()
            Text("Yönetmen:\(movieDetailViewModel.movieDetails?.writer ?? "writer")")
                .padding()
            Text("Yönetmen:\(movieDetailViewModel.movieDetails?.awards ?? "awards")")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).padding()
            Spacer()
            
        }.onAppear(perform: {
            self.movieDetailViewModel
                .getMovieDetail (imdbId: imdbId)
        })
    }
}

#Preview {
    DetailView(imdbId: "test")
}
