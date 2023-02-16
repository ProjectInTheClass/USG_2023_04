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
    let genre: [String]
}

struct MovieResponse: Codable {
    let data: [Movie]
}


struct MovieListView: View {
    @State private var Movies:[Movie] = []
    var moviesByGenre: [String: [Movie]] {
        var moviesByGenre = [String: [Movie]]()
        for movie in Movies where !movie.genre.isEmpty {
            for genre in movie.genre {
                if moviesByGenre[genre] == nil {
                    moviesByGenre[genre] = [movie]
                } else {
                    moviesByGenre[genre]?.append(movie)
                }
            }
        }
        return moviesByGenre
    }
    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    @AppStorage("_Firstrun") var Firstrun: Bool = true
    @State var ShowOnboarding: Bool = true
    var body: some View {
        VStack(alignment: .center) {
            NavigationStack {
                ScrollView {
                    ForEach(moviesByGenre.keys.sorted(), id: \.self) { genre in
                        VStack(alignment: .leading) {
                            Text(genre)
                                .font(.headline)
                                .padding(.horizontal)
                                .padding(.top)
                            ScrollView(.horizontal, showsIndicators: false) {
                                LazyHStack {
                                    ForEach(moviesByGenre[genre] ?? [], id: \.self) { movie in
                                        NavigationLink(destination: ContentView()) {
                                            AsyncImage(url: URL(string:"http://mynf.codershigh.com:8080"+movie.image)) { image in
                                                image.resizable()
                                                    .frame(width: 150, height:200)
                                            } placeholder: {
                                                ProgressView()
                                            }
                                        }
                                    }
                                }
                                .padding(.horizontal)
                                .padding(.bottom)
                            }
                        }
                    }
                    .navigationTitle("Movie")
                    .onAppear(perform: fetchMovieList)
                }
            }
        }
    }
    
        
        
        private func fetchMovieList() {
            print("fetchMovieList")
            let urlStr = "http://mynf.codershigh.com:8080/api/movies"
            let url = URL(string: urlStr)!
            let request = URLRequest(url: url)
            URLSession.shared.dataTask(with: request) { data, response, error in
                do {
                    let ret = try JSONDecoder().decode(MovieResponse.self, from: data!)
                    for movie in ret.data {
                        Movies.append(movie)
                    }
                    // Update the state to trigger a re-render
                    self.Movies = Movies
                } catch {
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
