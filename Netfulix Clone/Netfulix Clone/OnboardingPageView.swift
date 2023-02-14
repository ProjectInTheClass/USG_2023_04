//
//  OnboardingPageView.swift
//  Netfulix Clone
//
//  Created by 백대홍 on 2023/02/14.
//
import SwiftUI
//MARK: - 온보딩뷰에 대한 페이지뷰
struct PageView: View {
    let title: String
    let subtitle: String
    let imageName: String
    let showsDismissButton: Bool
    @Binding var ShowOnboarding: Bool
    @State private var isAnimating: Bool = false
    
    var body: some View {
        ZStack {
            Color(.black)
                .edgesIgnoringSafeArea([.all])
            
            VStack(alignment: .center) {
                Text("NETFULIX")          //제일 위 제목
                    .font(.largeTitle.bold())
                    .foregroundColor(.red)
                    .padding(.top, 20)
                
                
                VStack {
                    Image(imageName)
                        .resizable()
                        .scaledToFit()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100.0, height: 100.0)
                        .padding()
                    
                    Text(title)
                        .font(.title2)
                        .bold()
                        .padding()
                    
                    
                    Text(subtitle)
                        .font(.headline)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: 250)
                        .foregroundColor(Color(red: 255 / 255, green: 140 / 255, blue: 0 / 255))
                        .shadow(color: Color.black.opacity(0.1), radius: 1, x: 2, y: 2)
                    
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
                            .frame(width: 200, height: 50)
                            .background(Color(red: 60 / 255, green: 179 / 255, blue: 113 / 255))
                        
                        
                    })
                }
                
            }
            .padding()
        }
    }
}

