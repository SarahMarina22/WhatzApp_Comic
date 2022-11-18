//
//  RecordModel.swift
//  WhatzApp_Comic
//
//  Created by Sarah Ndenbe on 18/11/22.
//

import Foundation

struct VoiceButton{
    var symbolicState : SymbolicState
    var isPressed : Bool
    var btnColor : String
}

enum SymbolicState {
    case Play,Pause,Mic
}
