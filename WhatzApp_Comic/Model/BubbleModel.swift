//
//  BubbleModel.swift
//  WhatzApp_Comic
//
//  Created by Sarah Ndenbe on 18/11/22.
//

import Foundation
import AVFAudio
import AVFoundation
import CoreAudio

struct Bubble : Identifiable{
    var id = UUID()
    var provenance : MessageFrom
    var isReplying : Bool
    var isFolded : Bool
    var isPlaying : Bool
    var isOnFocus : Bool = false // to know which time and date to display in ArianaLine
    var audio : AudioMessage
    var bubbleFrame : BubbleFrame  {
        if(isFolded == true){
           return  BubbleFrame.folded
        }else{
           return  BubbleFrame.big
        }
    }
    
    //DateInterval and TimeInterval
    
    var replyRef : String? // if a bubble is a reply, link it to the bubble
    
    func bubbleShaper () -> String{
        var bubbleShape : String
        if (provenance == .me){
            if(isReplying == true){
                if(isFolded == true){
                    bubbleShape = "User Voice Message fold reply"
                    return bubbleShape
                }else{
                    bubbleShape = "User Voice Message Reply"
                    return bubbleShape
                }
            }else{
                if(isFolded == true){
                    bubbleShape = "User Voice Message fold"
                    return bubbleShape
                }else{
                    bubbleShape = "User Voice Message"
                    return bubbleShape
                }
            }
        }else{
            if(isReplying == true){
                if(isFolded == true){
                    bubbleShape = "Ext Voice Message fold Reply"
                    return bubbleShape
                }else{
                    bubbleShape = "Ext Voice Message Reply"
                    return bubbleShape
                }
            }else{
                if(isFolded == true){
                    bubbleShape = "Ext Voice Message fold"
                    return bubbleShape
                }else{
                    bubbleShape = "Ext Voice Message"
                    return bubbleShape
                }
            }
        }
    }
    
   
    
}

struct AudioMessage{
    
    var audioName : String
    var duration : Int // in seconds
    var waveform : [Int] = shuffleFakeWave()
    var realWaveform : [bribMonologue] = [bribMonologue(aPosition: 0, aPulse: 0.2)]
    var reactionSpriteArray : [String] = ["heart0"]
  //  var sentDate : Date = Date(timeInterval: <#T##TimeInterval#>, since: .now) // to figure out
    
    func durationHumanFormatter () -> String{
        var humanReadableDuration : String
//        var day : Int
//        var hour : Int
//        var minute : Int
//        var sec : Int
//
        
        humanReadableDuration = duration.formatted()
        return humanReadableDuration
    }
    
    
    // duration to play remaining, duration already played
}

enum MessageFrom {
    case me,other
}

enum BubbleFrame{
    case big,folded
}

var testBubbleExtReplyFolded = Bubble(provenance: .other, isReplying: true, isFolded: true, isPlaying: false, audio: AudioMessage(audioName: "AUDIO-2022-11-21-06-50-24",  duration: 120))
var testBubbleExtNoReplyFolded = Bubble(provenance: .other, isReplying: false, isFolded: true, isPlaying: false, audio: AudioMessage(audioName: "AUDIO-2022-11-21-06-50-24", duration: 120))
var testBubbleMeReplyFolded = Bubble(provenance: .me, isReplying: true, isFolded: true, isPlaying: false, audio: AudioMessage( audioName: "AUDIO-2022-11-21-06-50-24", duration: 790))
var testBubbleMeNoReplyFolded = Bubble(provenance: .me, isReplying: false, isFolded: true, isPlaying: false, audio: AudioMessage( audioName: "AUDIO-2022-11-21-06-50-24", duration: 790))

var testBubbleExtReplyBig = Bubble(provenance: .other, isReplying: true, isFolded: false, isPlaying: false, audio: AudioMessage(audioName: "AUDIO-2022-11-21-06-50-24", duration: 120))
var testBubbleExtNoReplyBig = Bubble(provenance: .other, isReplying: false, isFolded: false, isPlaying: false, audio: AudioMessage(audioName: "AUDIO-2022-11-21-06-50-24", duration: 120))
var testBubbleMeReplyBig = Bubble(provenance: .me, isReplying: true, isFolded: false, isPlaying: false, audio: AudioMessage( audioName: "AUDIO-2022-11-21-06-50-24", duration: 790))
var testBubbleMeNoReplyBig = Bubble(provenance: .me, isReplying: false, isFolded: false, isPlaying: false, audio: AudioMessage( audioName: "AUDIO-2022-11-21-06-50-24", duration: 790))

var disscuss = [
    testBubbleExtReplyBig,
    testBubbleMeReplyBig,
    testBubbleExtReplyFolded,
    testBubbleExtNoReplyFolded,
    testBubbleMeNoReplyFolded,
    testBubbleMeNoReplyBig,
    testBubbleExtNoReplyBig,
    testBubbleMeReplyFolded
]



func shuffleFakeWave() -> [Int]{
    var shuffleFW = [1,4,3,2,5,6,7,3,4,5,6,4,6,3,2,4,5,3,2,1,3,3,1,2,3,4,5,6,6]
    shuffleFW.shuffle()
    
    return shuffleFW
}


/// AUDIO MANAGER
///


struct bribMonologue {
    var aPosition : Int
    var aPulse : Float
}

func monologueToWaveform() /*-> [bribMonologue]*/ {
    var monologue : [bribMonologue] = []
    //recuperer le son
    let sourceFile: AVAudioFile
    let format: AVAudioFormat
    do {
        let sourceFileURL = Bundle.main.url(forResource: "bad", withExtension: "mp3")!
        sourceFile = try AVAudioFile(forReading: sourceFileURL)
        format = sourceFile.processingFormat
    } catch {
        fatalError("Unable to load the source audio file: \(error.localizedDescription).")
    }
    
    let engine = AVAudioEngine()
    let player = AVAudioPlayerNode()

    engine.attach(player)
    
    engine.connect(player, to: engine.outputNode, format: format)
    
    player.scheduleFile(sourceFile,
                            at: nil,
                            completionCallbackType: .dataPlayedBack)
    
    do {
        try engine.start()
        player.play()
    } catch {
        fatalError("Unable to start audio engine: \(error).")
    }
    
    
    //lire son PCM
    //populer monologue
  ///  return monologue
}




func readWavIntoFloats(fname: String, ext: String) -> [Float] {

    let url = Bundle.main.url(forResource: fname, withExtension: ext)
    let sourceFile : AVAudioFile
    let format : AVAudioFormat
    do {
        let sourceFileURL = Bundle.main.url(forResource: "bad", withExtension: "mp3")!
        sourceFile = try AVAudioFile(forReading: sourceFileURL)
        format = sourceFile.processingFormat
    } catch {
        fatalError("Unable to load the source audio file: \(error.localizedDescription).")
    }
    
    let engine = AVAudioEngine()
    let player = AVAudioPlayerNode()
    let reverb = AVAudioUnitReverb()
    
    engine.attach(player)
    engine.attach(reverb)

    // Set the desired reverb parameters.
    reverb.loadFactoryPreset(.mediumHall)
    reverb.wetDryMix = 50

    // Connect the nodes.
    engine.connect(player, to: reverb, format: format)
    engine.connect(reverb, to: engine.mainMixerNode, format: format)

    // Schedule the source file.
    player.scheduleFile(sourceFile, at: nil)

    do {
        // The maximum number of frames the engine renders in any single render call.
        let maxFrames: AVAudioFrameCount = 4096
        try engine.enableManualRenderingMode(.offline, format: format,
                                             maximumFrameCount: maxFrames)
    } catch {
        fatalError("Enabling manual rendering mode failed: \(error).")
    }

    do {
        try engine.start()
        player.play()
    } catch {
        fatalError("Unable to start audio engine: \(error).")
    }

    
    let buf = AVAudioPCMBuffer(pcmFormat: engine.manualRenderingFormat,
                               frameCapacity: engine.manualRenderingMaximumFrameCount)!
    try! sourceFile.read(into: buf)

    
    
    // this makes a copy, you might not want that
    let floatArray = Array(UnsafeBufferPointer(start: buf.floatChannelData?[0], count:Int(buf.frameLength)))
    
    return floatArray

}

var audioToChart : [Float] = readWavIntoFloats(fname: "bad", ext: "mp3")


