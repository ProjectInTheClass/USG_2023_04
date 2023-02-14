//
//  OnboardingPage2.swift
//  Netfulix Clone
//
//  Created by 백대홍 on 2023/02/14.
//

import SwiftUI

struct OnboardingPage2: View {
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
                    Image("온보딩2")
                        .resizable()
                        .frame(width: 200, height: 200)
                    Text("3, 2, 1....저장 시작!")
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                        .padding()
                    Text("저장 기능은 광고형 베이식을 제외한 모든 멤버십에서 이용할 수 있습니다.")
                        .font(.subheadline)
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

struct OnboardingPage2_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingPage2(ShowOnboarding: .constant(true),showsDismissButton: true)
    }
}
