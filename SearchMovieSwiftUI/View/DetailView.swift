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
        
        ZStack{
            
            Color.background
                .ignoresSafeArea(.all)
            
            VStack(alignment: .leading, spacing:5){
                
                ScrollView{
                    
                    HStack{
                        Spacer()
                        SpecImage(url: movieDetailViewModel.movieDetails?.poster ?? "").frame(width: UIScreen.main.bounds.width * 0.6, height: UIScreen.main.bounds.height * 0.4, alignment: .center)
                        Spacer()
                    }
                    
                    Text(movieDetailViewModel.movieDetails?.title ?? "The title of the movie will be shown.").bold().font(.title).foregroundColor(.titlecolor).padding()
                    
                    
                    HStack{
                        Spacer()
                        Text(movieDetailViewModel.movieDetails?.plot ?? "The plot of the movie will be shown.") .italic().foregroundColor(.textcolor)
                        Spacer()
                    }.frame(maxWidth: .infinity, alignment: .center)
                        .padding(10)
                    
                    
                    VStack(alignment: .leading, spacing: 5) {
                        
                        HStack {
                            Text("Director:").bold().foregroundColor(.boldcolor)
                            Text((movieDetailViewModel.movieDetails?.director ?? "The imdb rate of the movie will be shown."))
                        }
                        
                        HStack {
                            Text("Writer:").bold().foregroundColor(.boldcolor)
                            Text((movieDetailViewModel.movieDetails?.writer ?? "The imdb rate of the movie will be shown."))
                        }
                        
                        HStack {
                            Text("Awards:").bold().foregroundColor(.boldcolor)
                            Text((movieDetailViewModel.movieDetails?.awards ?? "The imdb rate of the movie will be shown."))
                        }
                        
                        HStack{
                            Text("Release Year:").bold().foregroundColor(.boldcolor)
                            Text((movieDetailViewModel.movieDetails?.year ?? "The imdb rate of the movie will be shown."))
                        }
                        
                        HStack{
                            Text("Genre:").bold().foregroundColor(.boldcolor)
                            Text((movieDetailViewModel.movieDetails?.genre ?? "The imdb rate of the movie will be shown."))
                        }
                        
                        HStack{
                            Text("Runtime:").bold().foregroundColor(.boldcolor)
                            Text((movieDetailViewModel.movieDetails?.runtime ?? "The imdb rate of the movie will be shown."))
                        }
                        
                        HStack{
                            Text("Language:").bold().foregroundColor(.boldcolor)
                            Text((movieDetailViewModel.movieDetails?.language ?? "The imdb rate of the movie will be shown."))
                        }
                        HStack{
                            Text("Imdb rate:").bold().foregroundColor(.boldcolor)
                            Text((movieDetailViewModel.movieDetails?.imdbRating ?? "The imdb rate of the movie will be shown."))
                        }
                        HStack{
                            Text("Country:").bold().foregroundColor(.boldcolor)
                            Text((movieDetailViewModel.movieDetails?.country ?? "The country of the movie will be shown."))
                        }
                    }.padding(15)
                    .foregroundColor(.detailcolor)

                    
                    Spacer()
                }
            }.onAppear(perform: {
                self.movieDetailViewModel.getMovieDetails(imdbId: imdbId)
            })
            
        }
        
       
    }
}

struct DetayView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(imdbId: "test")
    }
}
