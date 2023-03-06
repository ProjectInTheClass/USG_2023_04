//
//  VideoCardView.swift
//  Netfulix Clone
//
//  Created by 백대홍 on 2023/03/02.
//
import SwiftUI

struct VideoCardView: View {
    var video: Video
    
    var body: some View {
        ZStack {
            ZStack(alignment: .bottomLeading) {
                // 이미지 : 비디오 썸네일 + 반투명한 검은색 막 씌우기
                ZStack {
                    Image(uiImage: (video.thumnail))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        
                    
                }
                
                // 플레이 기호
                Image(systemName: "play.fill")
                    .foregroundColor(.white)
                    .font(.title3)
                    .padding()
                    .background(.ultraThinMaterial)
                    .cornerRadius(50)
            }
        }
    }
}
