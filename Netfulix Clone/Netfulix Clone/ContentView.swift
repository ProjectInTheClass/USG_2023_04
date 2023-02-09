//
//  ContentView.swift
//  Netfulix Clone
//
//  Created by 백대홍 on 2023/02/06.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
    var body: some View {
        TabView(selection: $selection) {
            MovieListView()
                .tag(0)
                .tabItem {
                    Text("영화 목록 보기")
                    Image(systemName: "display")
                }
            ActorsView()
                .tag(1)
                .tabItem {
                    Text("배우 목록 보기")
                    Image(systemName: "person.2")
                }
        }.font(.headline)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
