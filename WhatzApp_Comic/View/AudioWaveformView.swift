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
import DSWaveformImage

struct AudioWaveform: View {
    @EnvironmentObject var audioManager : AudioManager
    @State private var isEditing : Bool = false
    @State var audioMessage : Double = 0.0
    
    @State var audioURL = Bundle.main.url(forResource: "AUDIO-2022-11-21-06-50-24", withExtension: "m4a")!
    @State  var waveConfig : Waveform.Configuration = Waveform.Configuration(
        style: .filled(.gray),
        position: .origin(CGPoint(x: 0.6, y: 0.6)),
        verticalScalingFactor: 0.15
    )
    
    let timer = Timer
        .publish(every: 0.5, on: .main, in: .common)
        .autoconnect()
    
    var body: some View {
        ZStack {
            VStack (spacing: 40){
                // MARK : Waveform
                ZStack{
                    
                    WaveformView(audioURL: audioURL, configuration: waveConfig.with(style: .striped(.init(color: .gray, width:2, spacing: 2))), priority: .low)
                        .scaledToFill()
                    
                     //   .padding()
                    
                }.frame(height: 50)
                // MARK : Playback Time
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
                            .bold()
                    }.fontWeight(.light)
                        .offset(y: -35)
                        
                    
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
                .tint(audioMessage < 290.0 ? Color("fromMe") : .red)
                .offset(y: -15.5)
                
            }
            
        }.onReceive(timer){ _ in
            guard let player = audioManager .player, !isEditing else { return}
            audioMessage = player.currentTime
            
        }
    }
    
}


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
        ScrollView(.horizontal){
            WaveformView(audioURL: audioURL, configuration: waveConfig.with(style: .striped(.init(color: .gray, width: 3, spacing: 2))), priority: .high)
                .scaledToFit()
                .frame(width: 140)
                .padding()
        }
        BubbleView(voiceMessage: testBubbleMeReplyBig)
            .environmentObject(AudioManager())
    }
}

var audioURL = Bundle.main.url(forResource: "AUDIO-2022-11-21-06-50-24", withExtension: "m4a")!
var waveConfig : Waveform.Configuration = Waveform.Configuration(
    style: .filled(.gray),
    position: .origin(CGPoint(x: 0.6, y: 0.6)),
    verticalScalingFactor: 0.5
)
