//
//  MovieListView.swift
//  Netfulix Clone
//
//  Created by 백대홍 on 2023/02/06.
//
import SwiftUI

struct Movie: Codable, Hashable {
    let title: String
    let image: String
}

struct MovieResponse: Codable {
    let data: [Movie]
}


struct MovieListView: View {
    @State private var Movies:[Movie] = []
    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    
    var body: some View {
        VStack(alignment: .center) {
            NavigationStack {
                ScrollView(.vertical) {
                    LazyVGrid(columns: columns)  {
                        ForEach(Movies, id: \.self) { item in
                            AsyncImage(url: URL(string:"http://mynf.codershigh.com:8080"+item.image)) { image in
                                image.resizable()
                                    .frame(width: 150, height:200)
                            } placeholder: {
                                ProgressView()
                            }
                        }
                    }
                }
                .navigationTitle("영화")
                .onAppear(perform: fetchMovieList)
            }
            
            
            
            
        }
    }
    
    
    
    
    private func fetchMovieList() {
        // 굳이 다른곳에서 쓰지도 않는데 왜? private가 아닌가요?
        print("fetchMovieList")
        // 1. URL
        let urlStr = "http://mynf.codershigh.com:8080/api/movies"
        let url = URL(string: urlStr)!
        
        // 2. Request
        let request = URLRequest(url: url)
        
        // 3. Session, Task
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            do {
                let ret = try JSONDecoder().decode(MovieResponse.self, from: data!)
                //        print("ret :", ret.data)
                for item in ret.data {
                    Movies.append(item)
                }
            }
            catch {
                print("Error", error)
            }
        }.resume()
    }
}



struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
