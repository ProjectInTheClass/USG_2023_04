//
//  ContentView.swift
//  Netfulix Clone
//
//  Created by 백대홍 on 2023/02/06.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack {
            MovieListView()
            ActorsView()
        }
        .padding(.top)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
