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
                    HStack{
                        Spacer()
                        VStack(alignment:.leading, spacing: 30){
                            HStack{
                                AsyncImage(url: URL(string:"http://mynf.codershigh.com:8080"+movie.image)){
                                    image in
                                    image.resizable()
                                        .frame(width: 100, height: 150)
                                    
                                }placeholder: {
                                    ProgressView()
                                }
                                    
            
                            }
            
                            VStack(alignment: .leading){
                                Text(movie.title)
                                    .font(.largeTitle)
                                HStack{
                                    Text("2021")
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
