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
        var moviesByGenre = [String: [Movie]]() //MoviesByGeneric 사전은 장르 이름을 Movie 개체의 배열에 매핑하는 빈 사전으로 초기화됩니다.
        for movie in Movies where !movie.genre.isEmpty { //영화 배열 내부 각 Movie개체에 대해 반복문을 이용해서 isEmpty로 장르부분이 비어있지는 않는지 검사한다.
            for genre in movie.genre {
                if moviesByGenre[genre] == nil, genre !=  "" { //장르에 대한 키값이 moviesByGenre에 있는지 확인하고 없다면 새로운 쌍을 만든다.
                    moviesByGenre[genre] = [movie]
                } else {
                    moviesByGenre[genre]?.append(movie) //이미 값이 존재한다면 장르의 영화 배열에 추가한다.
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
                                .font(.headline.bold())
                                .padding(.horizontal)
                                .padding(.top)
                            ScrollView(.horizontal, showsIndicators: false) {
                                LazyHStack {
                                    ForEach(moviesByGenre[genre] ?? [], id: \.self) { movie in
                                        NavigationLink(destination: DetailView(movie: movie)) {
                                            AsyncImage(url: URL(string:"http://mynf.codershigh.com:8080"+movie.image)) { image in
                                                image.resizable()
                                                    .frame(width: 200, height:200)
                                                    .scaledToFit()
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
                .fullScreenCover(isPresented: $Firstrun) {
                    OnboardingMainView(ShowOnboarding: $Firstrun)
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
