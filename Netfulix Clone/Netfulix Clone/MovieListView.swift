//
//  MovieListView.swift
//  Netfulix Clone
//
//  Created by 백대홍 on 2023/02/06.
//
import SwiftUI

struct Movie: Codable, Hashable {
    var title: String
    var image: String
    var genres: [String]
}

struct MovieResponse: Codable {
    let data: [Movie]
}


struct MovieListView: View {
    @State private var movies: [Movie] = []
    @AppStorage("_Firstrun") var Firstrun: Bool = false
    @State var ShowOnboarding: Bool = true

    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 1)
    var genre: String
    
    var body: some View {
        VStack(alignment: .center) {
            NavigationStack {
                ScrollView(.horizontal) {
                    LazyVGrid(columns: columns) {
                        ForEach(movies, id: \.self) { movie in
                            NavigationLink(destination: DetailView(movie: movie)) {
                                AsyncImage(url: URL(string: "http://mynf.codershigh.com:8080" + movie.image)) { image in
                                    image.resizable()
                                        .frame(width: 150, height: 200)
                                } placeholder: {
                                    ProgressView()
                                }
                            }
                        }
                    }
                }
                .navigationTitle("Movie")
                .onAppear(perform: fetchMovieList)
            }
        }
        .fullScreenCover(isPresented: $Firstrun) {
            OnboardingView(ShowOnboarding: $Firstrun)
        }
    }
    
    func fetchMovieList() {
        guard let url = URL(string: "http://mynf.codershigh.com:8080/api/movies?genre=\(genre)") else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return }
            do {
                let movies = try JSONDecoder().decode([Movie].self, from: data)
                DispatchQueue.main.async {
                    self.movies = movies
                }
            } catch let error {
                print(error)
            }
        }.resume()
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView(genre: "action")
    }
}

