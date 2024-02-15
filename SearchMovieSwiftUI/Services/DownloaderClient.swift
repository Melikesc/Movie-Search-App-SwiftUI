//
//  HttpD.swift
//  SearchMovieSwiftUI
//
//  Created by Melike Sultan CAN on 6.02.2024.
//

import Foundation

class DownloaderClient { //film verilerini indirme işlemlerini yönetmek için oluşturulan sınıf
    //internetten film verileri indirmek için kullanılacak downloadMovies fonksiyonu
    func downloadMovies(search : String, completion: @escaping //@escaping closure: asenkron çalışacak main threadi bloklamadan arka tarafta çalışsın diye.
            (Result<[Movie]? , DownloaderError>) -> Void ) {
        
        
        //guard-else : yanlışların önüne geçmek için (if else de kullanabilirdik.)
        guard let url = URL(string:
            "https://www.omdbapi.com/?s=\(search)&apikey=(apikey)") else {
            return completion(.failure(.wrongUrl))
        }
        
        //ağ isteğinin sonucuna göre belirli işlemleri gerçekleştirmek için
        //---parametreleri, ağ isteğinin sonucunu
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            /*data: sunucudan gelen veri
             response:sunucunun yanıtını (HTTP yanıtı)
             error: herhangi bir hata oluştuğunda*/
            guard let data = data, error == nil else {
                return completion(.failure(.datasDidNotCome))
            }
            
            guard let movieResponse = try? JSONDecoder().decode(gelenMovies.self, from: data) else {
                return completion(.failure(.dataCouldNotProcessed))
            }
            completion(.success(movieResponse.movies))
        }.resume()
    }
    
    func downloadMovieDetail(imdbId : String, completion: @escaping (
    Result<MovieDetail,DownloaderError>) -> Void) {
        guard let url = URL(string: "https://www.omdbapi.com/?s=\(imdbId)&apikey=(apikey)") 
        else {
            return completion(.failure(.wrongUrl))
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                return completion(.failure(.datasDidNotCome))
            }
            guard let gelenMovieDetail = try? JSONDecoder().decode(MovieDetail.self, from: data)
            else {
                return completion(.failure(.dataCouldNotProcessed))
            }
            completion(.success(gelenMovieDetail))
        }.resume()
        
        
    }
    
    
    
}


enum DownloaderError: Error { // fail olursa ne olacağını belirtmeliyiz.
    case wrongUrl
    case datasDidNotCome
    case dataCouldNotProcessed
}
