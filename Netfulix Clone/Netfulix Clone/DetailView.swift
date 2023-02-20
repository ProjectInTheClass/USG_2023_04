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
                                AsyncImage(url: URL(string:"http://mynf.codershigh.com:8080"+movie.image))
                                    .frame(width: 100, height: 150)
            
                            }
            
                            VStack(alignment: .leading){
                                Text(movie.title)
                                    .font(.largeTitle)
                                HStack{
                                    Text("2021")
                                    Text("장르")
                                }
            
            
                            }.padding()
            
                                Spacer()
                        }.frame(maxWidth: .infinity)
                        Spacer()
                    }
        }
    }
