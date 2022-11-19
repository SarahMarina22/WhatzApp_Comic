//
//  BubbleModel.swift
//  WhatzApp_Comic
//
//  Created by Sarah Ndenbe on 18/11/22.
//

import Foundation

struct Bubble{
    var provenance : MessageFrom
    var isReplying : Bool
    var isFolded : Bool
    var isPlaying : Bool
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
    
    var duration : Int // in seconds
    var waveform : [Int] = [0]
    var reactionSpriteArray : [String] = ["heart0"]
    
    func durationHumanFormatter () -> String{
        var humanReadableDuration : String
        var day : Int
        var hour : Int
        var minute : Int
        var sec : Int
      
        
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

var testBubbleExtFolded = Bubble(provenance: .other, isReplying: false, isFolded: false, isPlaying: false, audio: AudioMessage(duration: 120))
var testBubbleMeReplyFolded = Bubble(provenance: .me, isReplying: true, isFolded: true, isPlaying: false, audio: AudioMessage( duration: 790))
