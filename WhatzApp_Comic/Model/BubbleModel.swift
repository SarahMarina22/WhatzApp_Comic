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
    var duration : String
    var bubbleFrame : BubbleFrame
    
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

enum MessageFrom {
    case me,other
}

enum BubbleFrame{
    case big,folded
}

var testBubbleExtFolded = Bubble(provenance: .other, isReplying: false, isFolded: false, duration: "3:00", bubbleFrame: .folded)
var testBubbleMeReplyFolded = Bubble(provenance: .me, isReplying: true, isFolded: true, duration: "3:00", bubbleFrame: .folded)
