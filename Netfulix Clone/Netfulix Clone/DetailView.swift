//
//  DetailView.swift
//  Netfulix Clone
//
//  Created by 백대홍 on 2023/02/09.
//
import SwiftUI

struct DetailView: View {
    var movie: Movie
    
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
                    HStack{
                        Text("장르:")
                        ForEach(movie.genre, id: \.self) { genre in
                            Text(genre)
                        }
                    }
                    
                    
                }.padding()
                
                Spacer()
            }.frame(maxWidth: .infinity)
            Spacer()
        }
    }
}

