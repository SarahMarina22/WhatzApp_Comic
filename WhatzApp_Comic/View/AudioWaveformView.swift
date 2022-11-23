//
//  AudioWaveformView.swift
//  WhatzApp_Comic
//
//  Created by Sarah Ndenbe on 20/11/22.
//

import SwiftUI
import AVFAudio
import AVFoundation
import Charts

struct AudioWaveform: View {
    @EnvironmentObject var audioManager : AudioManager
    @State private var isEditing : Bool = false
    @State var audioMessage : Double = 0.0
    
    let timer = Timer
        .publish(every: 0.5, on: .main, in: .common)
        .autoconnect()
    
    var body: some View {
        ZStack {
            VStack {
                ZStack{
                    
                   // MonologueView()
                   // MonologueOverView(waveColor: .black)
                        
                    
                }
                /// MARK : Playback Time
                if let player = audioManager.player {
                    HStack {
                        Text(DateComponentsFormatter.positional.string(from: player.currentTime) ?? "0:00")
                            .padding(.bottom,5)
                            .foregroundColor(.secondary)
                            .font(.system(size: 13))
                        Spacer()
                        Text(DateComponentsFormatter.positional.string(from: player.currentTime - player.duration) ?? "-0:00")
                            .padding(.bottom,5)
                            .foregroundColor(.secondary)
                            .font(.system(size: 13))
                    }.fontWeight(.light)
                    
                }
                
            }
            
            // Conditional binding for the slider duration and pace
            if let player = audioManager.player {
                  Slider(value: $audioMessage, in: 0...player.duration){ editing in
                    if !editing {
                        isEditing = editing
                        player.currentTime = audioMessage
                    }
                    
                }
                    .tint(audioMessage > 30.0 ? Color("fromMe") : .red)
                    .frame(width: 150)
                    .offset(y: -15.5)
                  //  .mask(Text("What is alpha"))
                  
            }
            
        }.onReceive(timer){ _ in
            guard let player = audioManager .player, !isEditing else { return}
            audioMessage = player.currentTime
            
        }
    }
    
}

/*
 
 struct Monologue : View{
     var body: some View{
         Chart {
             ForEach(testBubbleExtReplyBig.audio.waveform,id: \.self){ strp in
                 BarMark(
                     x: .value("sarah", testBubbleExtReplyBig.audio.waveform[strp].distance(to: 0)),
                     y: .value("age", strp)
                 ).foregroundStyle(.green)
                     .cornerRadius(60)
                     
                    // .foregroundStyle(.shadow(.drop(radius: 90)))
             }
         }.chartXAxis(.hidden)
             .chartYAxis(.hidden)
             .frame(width : 140,height: 20)

     }
 }
 
 */
 

struct MonologueView : View{
    var body: some View{
        Chart {
            BarMark(
                x: .value("sarah", 0),
                y: .value("age", 2022)
            ).foregroundStyle(.gray)
            BarMark(
                x: .value("sarah", 1),
                y: .value("age", 5021)
            ).foregroundStyle(.gray)
            BarMark(
                x: .value("sarah", 2),
                y: .value("age", 2022)
            ).foregroundStyle(.gray)
            BarMark(
                x: .value("sarah", 3),
                y: .value("age", 4021)
            ).foregroundStyle(.gray)
        }.chartXAxis(.hidden)
            .chartYAxis(.hidden)
            .frame(width :  140,height: 20)

    }
}

struct MonologueOverView : View{
    var waveColor : Color
    var body: some View{
        Chart {
            BarMark(
                x: .value("sarah", 0),
                y: .value("age", 2022)
            ).foregroundStyle(waveColor)
            BarMark(
                x: .value("sarah", 1),
                y: .value("age", 5021)
            ).foregroundStyle(waveColor)
            BarMark(
                x: .value("sarah", 2),
                y: .value("age", 2022)
            ).foregroundStyle(waveColor)
            BarMark(
                x: .value("sarah", 3),
                y: .value("age", 4021)
            ).foregroundStyle(waveColor)
        }.chartXAxis(.hidden)
            .chartYAxis(.hidden)
          
    }
}

struct HomeMadeSlider : View {
    @EnvironmentObject var audioManager : AudioManager
    @State var width : CGFloat = 0
    
    var body: some View {
        VStack(spacing : 20){
            ZStack(alignment: .leading){
                Capsule().fill(.gray).frame(height: 8)
                Capsule().fill(.red).frame(width: self.width, height: 8)
                    .gesture(DragGesture()
                        .onChanged({ (value) in
                            let x = value.location.x
                            
                            self.width = x
                        }).onEnded({ (value) in
                            let x = value.location.x
                            
                            let screen = UIScreen.main.bounds.width - 30
                            
                            let percent = x / screen
                            
                            audioManager.player?.currentTime = Double(percent) * audioManager.player!.duration
                        }))
            }
        }
    }
}




struct AudioWaveformView_Previews: PreviewProvider {
    static var previews: some View {
        
        BubbleView(voiceMessage: testBubbleMeReplyBig)
            .environmentObject(AudioManager())
    }
}
