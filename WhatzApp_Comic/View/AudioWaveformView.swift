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
    @State var audioMessage : Double = 0.0
    
    var body: some View {
        ZStack {
            VStack {
                MonologueView()
                
                HStack {
                    Text("3:00")
                        .padding(.bottom,5)
                        .foregroundColor(.secondary)
                        .font(.system(size: 13))
                    Spacer()
                    Text("-0:50")
                        .padding(.bottom,5)
                        .foregroundColor(.secondary)
                        .font(.system(size: 13))
                }.fontWeight(.light)
                
            }
            Slider(value: $audioMessage, in: 0...60)
                .tint(audioMessage > 30.0 ? Color("fromMe") : .red)
                .frame(width: 150)
                .offset(y: -6.5)
            //  .mask({Text("WhatsApp")})
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
            ).foregroundStyle(.orange)
            BarMark(
                x: .value("sarah", 1),
                y: .value("age", 5021)
            ).foregroundStyle(.red)
            BarMark(
                x: .value("sarah", 2),
                y: .value("age", 2022)
            ).foregroundStyle(.yellow)
            BarMark(
                x: .value("sarah", 3),
                y: .value("age", 4021)
            ).foregroundStyle(.green)
        }.chartXAxis(.hidden)
            .chartYAxis(.hidden)
            .frame(width :  140,height: 20)

    }
}


struct AudioWaveformView_Previews: PreviewProvider {
    static var previews: some View {
        
        BubbleView(voiceMessage: testBubbleMeReplyBig)
        MonologueView()
        
    }
}
