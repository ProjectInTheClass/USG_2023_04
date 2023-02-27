//
//  ActorModalView.swift
//  usg_Practice07
//
//  Created by kimjiyeon on 2023/02/19.
//

import SwiftUI

struct Actor: Codable, Hashable {
    let name: String
    let image: String
}

struct ActorResponse: Codable {
    let data:[Actor]
}

struct ActorModalView: View {
    
    @Binding var isClosed: Bool
    
    @State private var Actors:[Actor] = []
    
    @State var movieDetailActor:Actor? = nil
    
    
    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 1)
    
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Button {
                    isClosed.toggle()
                } label: {
                    Image(systemName: "x.circle").foregroundColor(.gray)
                        .frame(width: 100, height: 50)
                }
            }
            
            HStack{
                ScrollView(.vertical){
                    LazyVGrid(columns: columns) {
                        ForEach(Actors, id: \.self) { item in
                            HStack{
                                AsyncImage(url: URL(string:"http://mynf.codershigh.com:8080"+item.image)) { image in
                                    image.resizable()
                                        .frame(width: 150, height:200)
                                } placeholder: {
                                    ProgressView()
                                }
                                Spacer()
                                Text(item.name)
                                    .bold()
                                    .foregroundColor(Color.white)
                                
                                Spacer()
                            }
                        }
                    }
                }.onAppear(perform: fetchActorList)
            }
            
        }.background(Color.black)
            
    }
    
    func fetchActorList() {
        print("fetchActorList")
        // 1. URL
        let urlStr = "http://mynf.codershigh.com:8080/api/actors"
        let url = URL(string: urlStr)!
        
        // 2. Request
        let request = URLRequest(url: url)
        
        // 3. Session, Task
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            do {
                let ret = try JSONDecoder().decode(ActorResponse.self, from: data!)
                //        print("ret :", ret.data)
                for item in ret.data {
                    
                    Actors.append(item)
                }
            }
            catch {
                print("Error", error)
            }
        }.resume()
    }
    
    
}
    

struct ActorModalView_Previews: PreviewProvider {
    static var previews: some View {
        ActorModalView(isClosed:.constant(true))
    }
}
