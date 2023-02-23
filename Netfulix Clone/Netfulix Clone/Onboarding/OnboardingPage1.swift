//
//  OnboardingPage1.swift
//  Netfulix Clone
//
//  Created by 백대홍 on 2023/02/14.
//

import SwiftUI

struct OnboardingPage1: View {
    @Binding var ShowOnboarding: Bool
    let showsDismissButton: Bool
    var body: some View {
        ZStack {
            Color(.black)
                .edgesIgnoringSafeArea([.all])
            
            VStack(alignment: .center) {
                HStack {
                    Text("NETFULIX")
                        .font(.title.bold())
                        .foregroundColor(.red)
                    Spacer()
                    Text("개인 정보")
                        .foregroundColor(.white)
                        .bold()
                    Text("고객 센터")
                        .foregroundColor(.white)
                        .bold()
                }
                .padding()
                VStack(alignment: .center) {
                    Image("온보딩1")
                        .resizable()
                        .frame(width: 300, height: 300)
                    Text("결제는 한번, 디바이스는 무제한")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.white)
                        .padding()
                    Text("스마트폰, 노트북, TV, 태블릿. 디바이스가 아무리 많아도 결제는 한번뿐!")
                        .font(.subheadline)
                        .bold()
                        .foregroundColor(.white)
                        .padding()
                    
                    Spacer()
                }
                
                
                if showsDismissButton {
                    // 온보딩이 끝나고 메인 페이지로 넘어가기 위한 버튼
                  
                    Button(action: {
                        ShowOnboarding.toggle()
                    }, label: {
                        Text("Get Start")
                            .foregroundColor(.white)
                            .bold()
                            .cornerRadius(20)
                            .frame(width: 400, height: 50)
                            .background(.red)
                        
                        
                    })
                }
                Spacer(minLength: 20)
            }.padding()
        }
    }
}

struct OnboardingPage1_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingPage1(ShowOnboarding: .constant(true),showsDismissButton: true)
    }
}
