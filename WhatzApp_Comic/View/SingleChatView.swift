//
//  SingleChatView.swift
//  Whatzapp0
//
//  Created by Sarah Ndenbe on 16/11/22.
//

import SwiftUI
import Charts
import AVFoundation

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
    @State var voiceMessage : Bubble
    @State var playingSymbol : String = "play.fill"
    var body: some View{
        ZStack(alignment: .center){
            Image(voiceMessage.bubbleShaper())
                .resizable()
                .frame(width: voiceMessage.isFolded ?  104 : 300,height: 114)
                .shadow(color: Color(UIColor.systemGray4), radius: 1)
                .padding()
            
                .overlay {
                    ZStack {
                        VStack(alignment: .leading){
                            Button {
                                //focus on the bubble replied
                            } label: {
                                HStack (alignment: .top){
                                                                
                                                                if(voiceMessage.isReplying == true){
                                                                    Image(systemName: "arrowshape.turn.up.backward.fill") // 􁖾 or 􀰛
                                                                        .foregroundColor(.gray)
                                                                        .font(.system(size: 14))
                                                                    Spacer()
                                                                    
                                                                }
                                                            } .padding(.top,30)
                                                                .padding(.leading,voiceMessage.isFolded ? 94 : 294)
                            }

                            
                            Spacer()
                        }
                        if(voiceMessage.isFolded == true){
                            VStack {
                                Button {
                                    
                                        // play the audio
                    
                                    voiceMessage.isPlaying.toggle()
                                    voiceMessage.isFolded.toggle()
                                    playingSymbol = "pause.fill"
                                } label: {
                                    Image(systemName: "play.fill")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 28))
                                }

                                Text(voiceMessage.audio.durationHumanFormatter())
                                    .padding(.top,8)
                                    .padding(.bottom,5)
                                    .foregroundColor(.secondary)
                                    .font(.system(size: 13))
                            }.padding(.top,50)
                        }else{
                            HStack {
                                Spacer()
                                VStack {
                                    Button {
                                        
                                            // pause and play the message
                                        voiceMessage.isPlaying.toggle()
                                        playingSymbol = voiceMessage.isPlaying ? "pause.fill" : "play.fill"
                                    } label: {
                                        Image(systemName: playingSymbol)
                                                                                .foregroundColor(.gray)
                                                                                .font(.system(size: 28))
                                    }

                                }
                                Spacer()
                                VStack {
                                    Text("Iili.illl:iil.illl:iiili...:iii.li.")
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
                                .padding(.horizontal)
                                .padding(.top)
                                Button {
                                    // forward to the next trim existing
                                }label: {
                                    Label("forward to trim", systemImage: "forward.frame.fill")
                                        .font(.system(size: 20))
                                        .foregroundColor(.black)
                                        .labelStyle(.iconOnly)
                                        
                                       
                                }.buttonStyle(.borderedProminent)
                                    .buttonBorderShape(.roundedRectangle(radius: 10))
                                    .tint(RadialGradient(colors: [Color("Color"),Color(.red)], center: .center, startRadius: .infinity, endRadius: .zero))
                                    .shadow(radius: 1,x: 0,y: -0)
                                    

                               
                                Spacer()
                            }
                            .padding(.trailing,20)
                            .padding(.leading,30)
                            .padding(.top,35)
                        }
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

