//
//  KeyboardView.swift
//  WhatzApp_Comic
//
//  Created by Sarah Ndenbe on 19/11/22.
//

import SwiftUI
import SpriteKit

struct Keyboard:View{
    
    @State var voiceInShape : String = "Voice Message"
    @State var isVoiceMessageDone : Bool = false
    @State var isVoiceMessagePlaying : Bool = false // should be a variable environement
    @State var isReactionBtnPressed : Bool = false
    var body: some View{
        VStack {
            
            ZStack {
                Image("keyboard field")
                    .resizable()
                    .scaledToFill()
                HStack{
                    ReactionBtn(isVoiceMessagePlaying: $isVoiceMessagePlaying,btnIsPressed: $isReactionBtnPressed)
                    
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
            if (isReactionBtnPressed == false) {
                ZStack {
                    Image("Audio Keyboard Shape")
                        .resizable()
                        .scaledToFill()
                        .offset(y:-11)
                    
                    HStack(spacing: 5) {
                        Spacer()
                        RecButton().offset(y:-35)
                        TrimButton().offset(y:-35).padding(.trailing,70)
                        
                    }
                }
            } else {
                ZStack {
                    Image("Audio Keyboard Shape")
                    .resizable()
                    .scaledToFill()
                    .offset(y:-11)
               
                    ReactionEmoji()
                }
            }
            Spacer()
        }.padding(.bottom,80)
    }
}

struct RecButton: View{
    @State var breathe : Bool = true
    @State var  buttonSymbol : String = "mic.fill"
    var body: some View{
        ZStack{
            Image("RecHalo")
                .resizable()
                .frame(width: 120,height: 120)
                .onAppear(){
                    withAnimation(.linear(duration: 3).delay(0).repeatForever(autoreverses: false)){
                        breathe.toggle()}
                }
               // .scaleEffect(breathe ? 1: 2)
                .opacity(breathe ? 1 : 0)
            Image("Rec Btn")
                .resizable()
                .frame(width: 45,height: 45)
                .onAppear(){
                    withAnimation(.linear(duration: 3).delay(0).repeatForever(autoreverses: false)){
                    }
                }
                .opacity(!breathe ? 0 : 1)
            Button {
                //
            } label: {
                ZStack {
                    Image("Rec Btn")
                        .resizable()
                        .frame(width: 90,height: 90)
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
                .frame(width: 70,height: 70)
                .onAppear(){
                    withAnimation(.linear(duration: 3).delay(10).repeatForever(autoreverses: false)){
                        breathe.toggle()}
                }
                .scaleEffect(breathe ? 1: 2)
                .opacity(breathe ? 1 : 0)
            Image("TrimBtn")
                .resizable()
                .frame(width: 40,height: 40)
                .onAppear(){
                    withAnimation(.linear(duration: 3).delay(0).repeatForever(autoreverses: false)){
                    }
                }
                .opacity(!breathe ? 0 : 0.8)
            Button {
                //
            } label: {
                ZStack {
                    Image("TrimBtn")
                        .resizable()
                        .frame(width: 60,height: 60)
                    Image(systemName:  buttonSymbol)
                        .resizable()
                        .frame(width: 20,height: 20)
                        .foregroundColor(.blue)
                }
            }
        }
    }
}


struct KeyboardView_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            Header()
            TheTimeline()
            Keyboard()
        }
    }
}

struct ReactionBtn: View {
    @Binding var isVoiceMessagePlaying : Bool
    @Binding var btnIsPressed : Bool
    var body: some View {
        Button {
            //display reaction and timestamp
            heart.reactionName = "heart"
            heart.size = CGSize(width: 90, height: 110)
            
            like.reactionName = "like"
            like.size = CGSize(width: 90, height: 160)
            
            dislike.reactionName = "dislike"
            dislike.size = CGSize(width: 100, height: 120)
            
            lol.reactionName = "lol"
            lol.size = CGSize(width: 100, height: 120)
            
            wow.reactionName = "wow"
            wow.size = CGSize(width: 80, height: 80)
            
            what.reactionName = "what"
            what.size = CGSize(width: 60, height: 60)
            
            btnIsPressed.toggle()
        } label: {
            ZStack {
                Rectangle()
                    .frame(width: 38,height: 34)
                    .cornerRadius(10)
                    .foregroundColor(Color(isVoiceMessagePlaying ? .white : UIColor.systemGray4))
                    .shadow(radius: 1)
                if( btnIsPressed  == false ){
                    Image( "Emoji Glyph")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 25,height: 25)
                    
                }else{
                    Image( systemName: "mic.fill")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 20,height: 20)
                }
            }
        }
    }
}



struct ReactionEmoji:View{
    @EnvironmentObject var audioManager : AudioManager
    var body: some View{
        
        VStack {
            HStack {
                Button {
                    audioManager.reactionName = "heart0"
                } label: {
                    SpriteView(scene: heart)
                }
                Button {
                    audioManager.reactionName = "like0"
                } label: {
                    SpriteView(scene: like)
                }
                Button {
                    audioManager.reactionName = "dislike0"
                } label: {
                    SpriteView(scene: dislike)
                }
                Button {
                    audioManager.reactionName = "lol0"
                } label: {
                    SpriteView(scene: lol)
                }
                Button {
                    audioManager.reactionName = "wow0"
                } label: {
                    SpriteView(scene: wow)
                }
                Button {
                    audioManager.reactionName = "what0"
                } label: {
                    SpriteView(scene: what)
                }
            }.frame(alignment: .center)
                .frame(height: 60)
                .padding()
                
            Spacer()
        }
    }
}

