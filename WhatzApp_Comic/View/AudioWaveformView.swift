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
                Text("Iili.illl:iil.illl:iiili...:iii.li.")
                ForEach(audioToChart, id: \.self ){ num in
                     Text(String(num))
                        .foregroundColor(.red)
                }
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
                .tint(Color("fromMe"))
                .foregroundColor(Color("fromMe"))
                .frame(width: 150)
                .offset(y: -6.5)
            //  .mask({Text("WhatsApp")})
        }
    }
    
  
}

struct AudioWaveformView_Previews: PreviewProvider {
    static var previews: some View {
        BubbleView(voiceMessage: testBubbleMeReplyBig)
    }
}
