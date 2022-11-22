//
//  AudioManager.swift
//  WhatzApp_Comic
//
//  Created by Sarah Ndenbe on 22/11/22.
//

import Foundation
import AVKit
 
final class AudioManager : ObservableObject {
  //  static let shared = AudioManager()
    
    var player : AVAudioPlayer?
    
    func startPlayer(messageAudioName : String){
        guard let sourceFileURL = Bundle.main.url(forResource: messageAudioName, withExtension: "m4a")  else {
            print("Audio file not found: \(messageAudioName)")
            return
        }
        
        do{
            
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .voiceChat)
            try AVAudioSession.sharedInstance().setActive(true)
            player = try AVAudioPlayer(contentsOf: sourceFileURL)
            
            player?.play()
        }catch{
            print("Fail to play", error)
        }
        
    }
    
}

