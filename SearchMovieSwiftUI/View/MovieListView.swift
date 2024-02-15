//
//  ContentView.swift
//  SearchMovieSwiftUI
//
//  Created by Melike Sultan CAN on 6.02.2024.
//

import SwiftUI

struct MovieListView: View {
    
    @ObservedObject var movieListViewModel : MovieListViewModel
    @State var MovieToSearch = ""
    
    init() {
        self.movieListViewModel = MovieListViewModel()
        self.movieListViewModel.searchMovie(movieName: MovieToSearch)
    }
    
    var body: some View {
        
        NavigationView{
            
            VStack{
                
                TextField("Movie to Search.. ", text: $MovieToSearch, onEditingChanged:{ _ in } , onCommit: {
                    self.movieListViewModel
                        .searchMovie(movieName: MovieToSearch
                            .trimmingCharacters(in: .whitespacesAndNewlines)
                            .addingPercentEncoding(withAllowedCharacters:
                                    .urlHostAllowed) ?? MovieToSearch)  // boşluk ve yeni satırları url'de anlamlı bir hale getirmeliyiz.
                }).padding(10)
                
                    .background(.backgroundcolor) //searchbar'ın arka plan rengi
                    .cornerRadius(5) //searchbar kenarlığı
                
                
                
                List(movieListViewModel.movies , id: \.imdbId) //aradığımız filmden çıkan sonuçları alt alta liste haline getirdik.
                { movie in
                    
                    NavigationLink(
                        destination: DetailView(imdbId: movie.imdbId),
                                   label: {
                                       HStack () { // film posteri adı ve yılını yan yana görüyoruz.
                                           SpecImage(url: movie.poster)
                                               .frame(width: 80, height: 100)
                                           
                                           
                                           VStack(alignment: .leading) {
                                               Text(movie.title)
                                                   .font(.title3)
                                                   .foregroundColor(.blue)
                                               
                                               
                                               Text(movie.year)
                                                   .foregroundColor(.orange)
                                               
                                           }
                                       }
                        })
                    
                   
                }.navigationTitle(Text("Movie Book"))
            }.padding(10)
            
        }
    }
}
#Preview {
    MovieListView()
    
}

