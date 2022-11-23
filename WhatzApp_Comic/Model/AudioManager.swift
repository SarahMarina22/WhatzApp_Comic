//
//  AudioManager.swift
//  WhatzApp_Comic
//
//  Created by Sarah Ndenbe on 22/11/22.
//

import Foundation
import AVKit
 
final class AudioManager : ObservableObject {
 
    
    var player : AVAudioPlayer?
    @Published private(set) var isPlaying : Bool = false{
        didSet {
            print("is Playing ", isPlaying )
        }
    }
    func startPlayer(messageAudioName : String){
        guard let sourceFileURL = Bundle.main.url(forResource: messageAudioName, withExtension: "m4a")  else {
            print("Audio file not found: \(messageAudioName)")
            return
        }
        
        do{
            
            // So the sound keeps playing in background and keeps playing in silent mode
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback,
                                    mode: .default)
            
            try AVAudioSession.sharedInstance().setActive(true)
            player = try AVAudioPlayer(contentsOf: sourceFileURL)
            player?.prepareToPlay()
            player?.play()
            isPlaying = true
        }catch{
            print("Fail to play", error)
        }
        
    }
    
    func getDate(messageAudioName : String)->String{
        var info : String = ""
        guard let sourceFileURL = Bundle.main.url(forResource: messageAudioName, withExtension: "m4a")else {return ""}
       
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "YY-MM-dd"
        
        info = dateFormatter.string(from: sourceFileURL.createdDate)
 
            return info
        
    }
    
    func getHour(messageAudioName : String)->String{
        var info : String = ""
        guard let sourceFileURL = Bundle.main.url(forResource: messageAudioName, withExtension: "m4a")else {return ""}
       
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "hh:mm"
        
        info = dateFormatter.string(from: sourceFileURL.createdDate)
 
            return info
        
    }
    
    
    func playPause()  {
        guard let player = player else {
            print("Issue with audio not found")
            return
        }
        
        if player.isPlaying {
            player.pause()
            isPlaying = false
        }else{
            player.play()
            isPlaying = true
        }
    }
    
}

