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
    let comments:[Comment]
}

struct MovieDetailResponse:Codable{
    let data:MovieDetail
}

struct Comment:Codable, Hashable{
    let _id: String
    let userId: String
    let name: String
    let text: String
    let rating:Double
}

struct DetailView: View {
    var movie: Movie
    @State var movieDetail:MovieDetail? = nil
    @State var movieComment:[Comment]? = nil
    
    var body: some View {
        GeometryReader { geometry in
            VStack{
                VStack(alignment:.leading, spacing: 0) {
                    ZStack{
                        AsyncImage(url: URL(string:"http://mynf.codershigh.com:8080"+movie.image)){
                            image in
                            image.resizable()
                                .frame(width:geometry.size.width, height: 300)
                                .opacity(0.4)
                            
                            
                        }placeholder: {
                            ProgressView()
                        }
                        AsyncImage(url: URL(string:"http://mynf.codershigh.com:8080"+movie.image)){
                            image in
                            image.resizable()
                                .frame(width:150, height: 200)
                            
                            
                        }placeholder: {
                            ProgressView()
                        }
                    }
                    
                    VStack(alignment: .leading) {
                        Text(movie.title)
                            .font(.largeTitle)
                        Text(String(movieDetail?.year ?? 2021))
                        HStack{
                            Text("장르:")
                            ForEach(movie.genre, id: \.self) { genre in
                                Text(genre)
                            }
                        }
                        HStack{
                            Text("출연: ")
                            ForEach(movieDetail?.actors ?? [], id: \.self) {
                                item in
                                Text(item.name+",")
                                
                            }
                        }
                        
                       
                    }.padding()
                    
                    ScrollView{
                        VStack(alignment: .leading) {
                            ForEach(movieComment ?? [], id: \.self) {
                                item in
                                VStack{
                                    HStack(alignment: .top){
                                        Text(item.name+":")
                                        Text(item.text.prefix(15)+(item.text.count > 15 ? "...":""))
                                        Spacer()
                                        Text("평점: "+String(format: "%0.1f", item.rating))
                                    }
                                }//.background(Color.gray)
  
                            }.border(.gray.opacity(0.3))
                        }
                        
                    }
                    HStack{
                        Text("ID: ")
                        
                    }

                    Spacer()
                }.frame(maxWidth: .infinity)
                Spacer()
        }
        
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
                movieComment = ret.data.comments
                
            } catch {
                print("Error", error)
            }
        }.resume()
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(movie: Movie(
            _id: "631f9079842a834b759419d9",
            title: "수리남",
            image: "/poster/1663012985184.jpeg", genre: ["드라마","범죄","스릴러"]
        ))
    }
}
