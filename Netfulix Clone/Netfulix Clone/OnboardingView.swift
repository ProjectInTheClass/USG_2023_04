//
//  OnboardingView.swift
//  Netfulix Clone
//
//  Created by 백대홍 on 2023/02/13.
//
//MARK: - onboardingview
import SwiftUI

struct OnboardingView: View {
    @Binding var ShowOnboarding: Bool
    var body: some View {
        
        TabView {
            PageView(title:"결제는 한번, 디바이스는 무제한",
                     subtitle:"스마트폰, 노트북, TV, 태블릿. 디바이스가 아무리 많아도 결제는 한번뿐",
                     imageName: "온보딩1",
                     showsDismissButton: true,
                     ShowOnboarding: $ShowOnboarding
            )
            
            PageView(title:"3, 2, 1....저장 시작!",
                     subtitle:"저장 기능은 광고형 베이식을 제외한 모든 멤버십에서 이용할 수 있습니다.",
                     imageName: "온보딩2",
                     showsDismissButton: true,
                     ShowOnboarding: $ShowOnboarding
                     
            )
            
            
            PageView(title: "약정도 광고도 없다",
                     subtitle: "가입은 당일, 해지는 원할 때",
                     imageName: "온보딩3",
                     showsDismissButton: true,
                     ShowOnboarding: $ShowOnboarding
                     
            )
            
            PageView(title: "시청하려면 어떻게 하나요?",
                     subtitle: "넷플릭스에 가입하면 앱으로 시청 가능합니다.",
                     imageName: "온보딩4",
                     showsDismissButton: true,
                     ShowOnboarding: $ShowOnboarding
                     
            )
            
            
            
            
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(ShowOnboarding: .constant(true))
    }
}
