//
//  ContentView.swift
//  SearchMovieSwiftUI
//
//  Created by Melike Sultan CAN on 6.02.2024.
//

import SwiftUI

struct MovieListView: View {
    
    @ObservedObject var movieListViewModel : MovieListViewModel
    
    @State var movieToSearch = ""
    
    init() {
        self.movieListViewModel = MovieListViewModel()
      
    }
    
    var body: some View {
        
        ZStack{
            
           
            Color.background
                .ignoresSafeArea(.all)
            
            
            NavigationView{
                
             
                
                VStack {
                   
                    
                    TextField("Enter the movie you're looking for..", text: $movieToSearch, onEditingChanged:{ _ in }, onCommit: {
                        self.movieListViewModel.searchMovie(movieName: movieToSearch.trimmingCharacters(in: .whitespacesAndNewlines).addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? movieToSearch)
                    }).padding().textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    List(movieListViewModel.movies, id: \.imdbId) { movie in
                        NavigationLink(
                            destination: DetailView(imdbId:movie.imdbId),
                            label: {
                                HStack() {
                                    
                                    SpecImage(url: movie.poster)
                                        .frame(width: 90, height:130)
                                    
                                    VStack(alignment: .leading) {
                                        Text(movie.title)
                                            .font(.title3)
                                            .foregroundColor(.blue)
                                        
                                        
                                        Text(movie.year)
                                            .foregroundColor(.orange)
                                    }
                                }
                            })
                        
                        
                    }.navigationTitle(Text("CineMate"))
                }
            }
        }
    }
}


#Preview {
    MovieListView()

}
