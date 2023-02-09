//
//  DetailView.swift
//  Netfulix Clone
//
//  Created by 백대홍 on 2023/02/09.
//

import SwiftUI

struct DetailView: View {
    let movie: Movie

        var body: some View {
            VStack(alignment: .center) {
                AsyncImage(url: URL(string: "http://mynf.codershigh.com:8080" + movie.image)) { image in
                    image.resizable()
                        .frame(width: 300, height:400)
                } placeholder: {
                    ProgressView()
                }

                Text(movie.title)
                    .font(.title)
                    .padding(.bottom, 20)

                Text("Description of the movie...")
                    .padding(.bottom, 20)

                Text("Comments about the movie...")
            }
        }
    }

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(movie: Movie(title: "수리남", image: "/poster/1663012985184.jpeg"))
    }
}
