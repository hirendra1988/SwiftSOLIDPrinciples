//
//  MediaPlayback.swift
//  SolidPrinciples
//
//  Created by Hirendra Sharma on 15/03/25.
//

//❌ Bad Example (Violating ISP)
//🚨 Problems:
//MusicPlayer is forced to implement playVideo(), which it doesn’t need.
//This breaks ISP because clients should not depend on methods they do not use.
//Leads to unnecessary or misleading implementations like fatalError().

protocol MediaPlayable {
    func playAudio()
    func playVideo()
}

class MusicPlayer: MediaPlayable {
    func playAudio() {
        print("Playing audio")
    }
    
    func playVideo() {
        // ❌ Music players cannot play video, but we are forced to implement this
        fatalError("MusicPlayer cannot play video")
    }
}

class VideoPlayer: MediaPlayable {
    func playAudio() {
        print("Playing audio")
    }
    
    func playVideo() {
        print("Playing video")
    }
}
