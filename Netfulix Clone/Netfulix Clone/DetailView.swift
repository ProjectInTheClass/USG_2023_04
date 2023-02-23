//
//  DetailView.swift
//  Netfulix Clone
//
//  Created by 백대홍 on 2023/02/09.
//
import SwiftUI

struct MovieDetail:Codable,Hashable{
    let year: Int
    let actors:[Actor]
}

struct MovieDetailResponse:Codable{
    let data:MovieDetail
}

struct DetailView: View {
    var movie: Movie
    @State var movieDetail:MovieDetail? = nil
    
    var body: some View {
        ScrollView {
            VStack(alignment:.center, spacing: 30) {
                HStack{
                    AsyncImage(url: URL(string:"http://mynf.codershigh.com:8080"+movie.image)){
                        image in
                        image.resizable()
                            .frame(width:400, height: 400)
                            
                            
                    }placeholder: {
                        ProgressView()
                    }
                }
                
                VStack(alignment: .center) {
                    Text(movie.title)
                        .font(.largeTitle)
                    Text(String(movieDetail?.year ?? 2021))
                    HStack{
                        Text("장르:")
                        ForEach(movie.genre, id: \.self) { genre in
                            Text(genre)
                        }
                    }
                    ForEach(movieDetail?.actors ?? [], id: \.self) {
                        item in
                        HStack{
                            Text(item.name+",").border(.blue)
                        }
                    }
                    
                    
                    
                }.padding()
                
                Spacer()
            }.frame(maxWidth: .infinity)
            Spacer()
        }.onAppear(perform: fetchDetailList)
    }
    func fetchDetailList() {
    
        let movieUrlStr = "http://mynf.codershigh.com:8080/api/movies/"+movie._id
        let movieUrl = URL(string: movieUrlStr)!

        let movieRequest = URLRequest(url: movieUrl)

        URLSession.shared.dataTask(with: movieRequest) { data, response, error in
            do {
                let ret = try JSONDecoder().decode(MovieDetailResponse.self, from: data!)
                movieDetail = ret.data
                print(movieDetail?.year)
                print(movieDetail?.actors)
                
            } catch {
                print("Error", error)
            }
        }.resume()
}
}

