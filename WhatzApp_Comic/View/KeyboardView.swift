//
//  KeyboardView.swift
//  WhatzApp_Comic
//
//  Created by Sarah Ndenbe on 19/11/22.
//

import SwiftUI

struct Keyboard:View{
    @State var voiceInShape : String = "Voice Message"
    @State var isVoiceMessageDone : Bool = false
    @State var isVoiceMessagePlaying : Bool = false // variable environement
    var body: some View{
        VStack {
            
            ZStack {
                Image("keyboard field")
                    .resizable()
                    .scaledToFill()
                HStack{
                    Button {
                        //
                    } label: {
                        ZStack {
                            Rectangle()
                                .frame(width: 38,height: 34)
                                .cornerRadius(10)
                                .foregroundColor(Color(isVoiceMessagePlaying ? .white : UIColor.systemGray4))
                                .shadow(radius: 1)
                            Image("Emoji Glyph")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 25,height: 22)
                        }
                    }
                   
                    Spacer()
                    TextField("Voice Shaped", text: $voiceInShape)
                        .fontWeight(.light)
                        .foregroundColor(isVoiceMessageDone ? .black : .gray)
                        .frame(width: 145)
                    
                    Text("0:00") // bubble duration
                        .font(.system(size: 17))
                        .fontWeight(.light)
                        .foregroundColor(isVoiceMessageDone ? .black : .gray)
                    Button {
                        //
                    } label: {
                        Image(systemName: "arrow.up.circle.fill")
                            .resizable()
                            .scaledToFill()
                            .foregroundColor(isVoiceMessageDone ? .accentColor : .gray)
                            .frame(width: 25,height: 22)
                        
                    }.padding(.trailing,35)
                    
                    Button {
                                           
                                               // Suppr the voice message
                                               // bubble duration 0:00
                                           
                                           isVoiceMessageDone.toggle()
                                       } label: {
                                           Image(systemName: "delete.left.fill") // 􀆘
                                               .resizable()
                                               .scaledToFill()
                                               .frame(width: 25,height: 22)
                                       }

                }.padding(.horizontal)
            }
            ZStack {
                Image("Audio Keyboard Shape")
                    .resizable()
                    .scaledToFill()
                    .offset(y:-11)
                
                HStack {
                    Spacer()
                    RecButton().offset(y:-15)
                    TrimButton().offset(y:-15)
                }
            }
            Spacer()
        }
    }
}

struct RecButton: View{
    @State var breathe : Bool = true
    @State var  buttonSymbol : String = "mic.fill"
    var body: some View{
        ZStack{
            Image("RecHalo")
                .resizable()
                .frame(width: 150,height: 150)
                .onAppear(){
                    withAnimation(.linear(duration: 3).delay(0).repeatForever(autoreverses: false)){
                        /*breathe.toggle()*/}
                }
                .scaleEffect(breathe ? 1: 2)
                .opacity(breathe ? 1 : 0)
            Image("Rec Btn")
                .resizable()
                .frame(width: 50,height: 50)
                .onAppear(){
                    withAnimation(.linear(duration: 3).delay(0).repeatForever(autoreverses: false)){
                    }
                }
                .scaleEffect(breathe ? 2 :  1)
                .opacity(!breathe ? 0 : 1)
            Button {
                //
            } label: {
                ZStack {
                    Image("Rec Btn")
                        .resizable()
                        .frame(width: 100,height: 100)
                    Image(systemName:  buttonSymbol)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 33,height: 38)
                        .foregroundColor(.red)
                }
            }
        }
    }
}

struct TrimButton: View{
    @State var breathe : Bool = true
    @State var  buttonSymbol : String = "forward.frame"
    var body: some View{
        ZStack{
            Image("TrimHalo")
                .resizable()
                .frame(width: 150,height: 150)
                .onAppear(){
                    withAnimation(.linear(duration: 3).delay(0).repeatForever(autoreverses: false)){
                        /*breathe.toggle()*/}
                }
                .scaleEffect(breathe ? 1: 2)
                .opacity(breathe ? 1 : 0)
            Image("TrimBtn")
                .resizable()
                .frame(width: 50,height: 50)
                .onAppear(){
                    withAnimation(.linear(duration: 3).delay(0).repeatForever(autoreverses: false)){
                    }
                }
                .scaleEffect(breathe ? 2 :  1)
                .opacity(!breathe ? 0 : 1)
            Button {
                //
            } label: {
                ZStack {
                    Image("TrimBtn")
                        .resizable()
                        .frame(width: 100,height: 100)
                    Image(systemName:  buttonSymbol)
                        .resizable()
                        .frame(width: 33,height: 38)
                        .foregroundColor(.blue)
                }
            }
        }
    }
}


struct KeyboardView_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            Header().padding(.bottom,10)
            TheTimeline()
            Keyboard()
        }
    }
}
