//
//  OnboardingView.swift
//  Netfulix Clone
//
//  Created by 백대홍 on 2023/02/13.
//
//MARK: - onboardingview
import SwiftUI

struct OnboardingMainView: View {
    @Binding var showOnboarding: Bool
    var body: some View { 
        TabView {
            OnboardingPage1(showOnboarding: $showOnboarding,showsDismissButton: true)
            OnboardingPage2(showOnboarding: $showOnboarding,showsDismissButton: true)
            OnboardingPage3(showOnboarding: $showOnboarding,showsDismissButton: true)
            OnboardingPage4(showOnboarding: $showOnboarding,showsDismissButton: true)
        }
        .tabViewStyle(PageTabViewStyle())
        .ignoresSafeArea() 
    }
}

struct OnboardingMainView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingMainView(showOnboarding: .constant(true))
    }
}
