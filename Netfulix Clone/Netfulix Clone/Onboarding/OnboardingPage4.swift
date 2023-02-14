//
//  OnboardingPage4.swift
//  Netfulix Clone
//
//  Created by 백대홍 on 2023/02/14.
//

import SwiftUI

struct OnboardingPage4: View {
    @Binding var ShowOnboarding: Bool
    let showsDismissButton: Bool
    var body: some View {
        ZStack {
            Image("온보딩4")
                .resizable()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
            
            
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
                Spacer(minLength: 200)
                
                VStack(alignment: .center) {
                    Text("시청하려면 어떻게 하나요?")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                        .padding()
                    Text("넷플릭스에 가입하면 앱으로 시청 가능합니다.")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.white)
                        .padding()
                    
                    Spacer()
                }
               
                
                
                if showsDismissButton {
                    // 온보딩이 끝나고 메인 페이지로 넘어가기 위한 버튼
                    // ShowOnboarding 값을 false로 바꾸기 때문에 최초 실행 이후에는 onboardingview를 보여주지 않는다.
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

struct OnboardingPage4_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingPage4(ShowOnboarding: .constant(true),showsDismissButton: true)
    }
}
