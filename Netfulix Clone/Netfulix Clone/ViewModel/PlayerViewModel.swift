//
//  PlayerViewModel.swift
//  Netfulix Clone
//
//  Created by 백대홍 on 2023/03/02.
//
import SwiftUI
import AVKit

// AVPlayer를 위한 뷰 모델
class PlayerViewModel: ObservableObject {
    var player = AVPlayer()
    
    func play() {
        player.play()
    }
        
    func pause() {
        player.pause()
    }
}
