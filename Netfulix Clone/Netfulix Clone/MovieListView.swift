//
//  MovieListView.swift
//  Netfulix Clone
//
//  Created by 백대홍 on 2023/02/06.
//
import SwiftUI

struct Movie: Codable, Hashable {
    let _id: String
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
        var moviesByGenre = [String: [Movie]]() //moviesByGenre는 장르 이름을 Movie 개체의 배열로 초기화한다.
        
        for movie in Movies where !movie.genre.isEmpty { //영화 배열 내부 각 Movie개체에 대해 반복문을 이용해서 isEmpty로 장르부분이 비어있지는 않는지 검사한다.
            for genre in movie.genre {
                if moviesByGenre[genre] == nil, genre !=  "" { // moviesByGenre 사전에 반복되는 현재 장르에 대한 항목이 아직 없는지, 장르가 빈 문자열이 아닌지 확인합니다. 이 두 조건이 모두 참이면 장르를 키로 하고 현재 영화를 값으로 포함하는 배열을 사용하여 moviesByGenre에 새 항목을 만듭니다.
                    moviesByGenre[genre] = [movie]
                } else {
                    moviesByGenre[genre]?.append(movie) //현재 장르에 대한 항목이 이미 있는 경우 실행됩니다. 이 경우 moviesByGenre의 기존 장르키와 연결된 배열에 현재 movie를 추가한다.
                }
            }
        }
        return moviesByGenre
    }
    
    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    @AppStorage("_Firstrun") var Firstrun: Bool = true
    @State var showOnboarding: Bool = true
    var body: some View {
            
            VStack(alignment: .center) {
                Onboarding_Netfulix()
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
                                                        .aspectRatio(contentMode: .fill)
                                                        .clipShape(Circle())
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
                        OnboardingMainView(showOnboarding: $Firstrun)
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
