//
//  OnboardingPage3.swift
//  Netfulix Clone
//
//  Created by 백대홍 on 2023/02/14.
//

import SwiftUI

struct OnboardingPage3: View {
    @Binding var showOnboarding: Bool
    let showsDismissButton: Bool
    var body: some View {
        ZStack {
            Color(.black)
                .edgesIgnoringSafeArea([.all])
            
            VStack(alignment: .center) {
                Onboarding_Netfulix()
                
                VStack(alignment: .center) {
                    Image("온보딩3")
                        .resizable()
                        .frame(width: 300, height: 300)
                    Spacer(minLength: 30)
                    Text("약정도 광고도 없다")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.white)
                        .padding()
                    Text("가입은 당일, 해지는 원할 때")
                        .font(.subheadline)
                        .bold()
                        .foregroundColor(.white)
                        .padding()
                    
                    Spacer(minLength: 10)
                }
                
                
                if showsDismissButton {
                    // 온보딩이 끝나고 메인 페이지로 넘어가기 위한 버튼
                    // ShowOnboarding 값을 false로 바꾸기 때문에 최초 실행 이후에는 onboardingview를 보여주지 않는다.
                    Button(action: {
                        showOnboarding.toggle()
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

struct OnboardingPage3_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingPage3(showOnboarding: .constant(true),showsDismissButton: true)
    }
}
