//
//  SingleChatView.swift
//  Whatzapp0
//
//  Created by Sarah Ndenbe on 16/11/22.
//

import SwiftUI

struct SingleChatView: View {
    var body: some View {
        
        ZStack {
            Color("Color")
            VStack{
                Header().padding(.bottom,10)
                TheTimeline()
                Keyboard()
                
            }
        }
    }
}

struct SingleChatView_Previews: PreviewProvider {
    static var previews: some View {
        SingleChatView()
    }
}



struct BubbleView : View {
    var voiceMessage : Bubble
    var body: some View{
        ZStack(alignment: .center){
            Image(voiceMessage.bubbleShaper())
                .resizable()
                .frame(width: 104,height: 114)
                .shadow(color: Color(UIColor.systemGray2), radius: 1)
                .shadow(color: Color(UIColor.systemGray5), radius: 5)
                .padding()
            
                .overlay {
                    ZStack {
                        VStack(alignment: .leading){
                            HStack (alignment: .top){
                                
                                if(voiceMessage.isReplying == true){
                                    Image(systemName: "arrowshape.turn.up.backward.fill") // 􁖾 or 􀰛
                                        .foregroundColor(.gray)
                                        .font(.system(size: 14))
                                    Spacer()
                                    
                                }
                            } .padding(.top,30)
                                .padding(.leading,94)
                            Spacer()
                        }
                        VStack {
                            Image(systemName: "play.fill")
                                .foregroundColor(.gray)
                                .font(.system(size: 28))
                            Text("1 min 45")
                                .padding(.top,8)
                                .padding(.bottom,5)
                                .foregroundColor(.secondary)
                                .font(.system(size: 13))
                        }.padding(.top,50)
                    }
                }
        }
    }
}

struct TheTimeline : View {
    var body: some View {
        ScrollView(.horizontal) {
            ZStack {
                
                
                HStack{
                    BubbleView(voiceMessage:  testBubbleMeReplyFolded)
                    
                }
            }
        }.frame(height: 500)
    }
}


struct Header : View {
    var body: some View {
        ZStack{
            Color("BackgroundColor")
                .ignoresSafeArea()
            
            NavigationLink(destination: {
                CreditView()
            }, label: {
                VStack(alignment: .center) {
                    Spacer()
                    ZStack {
                        Image("Virginie")
                            .resizable()
                            .clipShape(Circle())
                            .scaledToFill()
                            .frame(width: 60,height: 80)
                            .shadow(color:.gray,radius: 2)
                        
                    }.padding(.top,80)
                        .padding(.bottom,-10)
                    HStack {
                        Text("Virginie Rey  ")
                            .font(.footnote)
                            .fontWeight(.light)
                            .foregroundColor(.primary)
                        Image("Chevron")
                            .resizable()
                            .frame(width: 5,height: 8)
                    }
                    
                }.padding()
            })
            
            
            
        }
        .toolbar(.hidden, for: .tabBar)
        .frame(height: 120)
    }
}

struct Keyboard:View{
    @State var voiceInShape : String = "Voice Message"
    @State var isVoiceMessageDone : Bool = false
    var body: some View{
        VStack {
            
            ZStack {
                Image("keyboard field")
                    .resizable()
                    .scaledToFill()
                HStack{
                    Button {
                        
                            // Suppr the voice message
                            // bubble duration 0:00
                        
                        isVoiceMessageDone.toggle()
                    } label: {
                        Image(systemName: "delete.right.fill") // 􀆘
                            .resizable()
                            .scaledToFill()
                            .frame(width: 25,height: 22)
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
                        
                    }.padding(.trailing,20)
                    Button {
                        //
                    } label: {
                        ZStack {
                            Rectangle()
                                .frame(width: 38,height: 34)
                                .cornerRadius(10)
                                .foregroundColor(Color(UIColor.systemGray4))
                                .shadow(radius: 1)
                            Image("Emoji Glyph")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 25,height: 22)
                        }
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
                    RecButton().offset(y:-11)
                    TrimButton().offset(y:-11)
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

