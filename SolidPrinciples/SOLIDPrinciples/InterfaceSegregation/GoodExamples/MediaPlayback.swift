//
//  ISPExample.swift
//  SolidPrinciples
//
//  Created by Hirendra Sharma on 15/03/25.
//

//The Interface Segregation Principle (ISP) in SOLID states:
//"Clients should not be forced to depend on interfaces they do not use."
//This means that a large interface should be broken down into smaller, more specific interfaces so that implementing classes only need to concern themselves with methods that are relevant to them.

//✅ Good Example (Following ISP)
//🎯 Why is this better?
//✔️ AudioPlayer implements only AudioPlayable and is not forced to handle videos.
//✔️ AVVideoPlayer implements both AudioPlayable and VideoPlayable as needed.
//✔️ Follows ISP by segregating interfaces into smaller, more relevant ones.

protocol AudioPlayable {
    func playAudio()
}

protocol VideoPlayable {
    func playVideo()
}

class AudioPlayer: AudioPlayable {
    func playAudio() {
        print("Playing audio")
    }
}

class AVVideoPlayer: AudioPlayable, VideoPlayable {
    func playAudio() {
        print("Playing audio")
    }
    
    func playVideo() {
        print("Playing video")
    }
}
