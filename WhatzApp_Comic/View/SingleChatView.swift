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
                .ignoresSafeArea()
            VStack{
                Header()//.padding(.bottom,30)
                TheTimeline()
                Keyboard()
            }
        }
    }
}

struct SingleChatView_Previews: PreviewProvider {
    static var previews: some View {
        SingleChatView()
            .environmentObject(AudioManager())
    }
}



struct BubbleView : View {
    @EnvironmentObject var audioManager : AudioManager
    @State var voiceMessage : Bubble
    @State var playingSymbol : String = "pause.fill"
    var body: some View{
        ZStack(alignment: .center){
            Image(voiceMessage.bubbleShaper())
            
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: voiceMessage.bubbleFrame == .folded ?  104 : 350,height: 107)
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
                                    .padding(.leading,voiceMessage.isFolded  && voiceMessage.provenance == .me ? 90 : voiceMessage.isFolded  && voiceMessage.provenance == .other ? 25 : !voiceMessage.isFolded  && voiceMessage.provenance == .me ? 325 : !voiceMessage.isFolded  && voiceMessage.provenance == .other ? 35 : 0)
                            }
                            
                            
                            Spacer()
                        }
                        if(voiceMessage.isFolded == true){
                            VStack {
                                Button {
                                    
                                    // play the audio
                                    audioManager.startPlayer(messageAudioName: voiceMessage.audio.audioName)
                                    voiceMessage.isPlaying.toggle()
                                    voiceMessage.isFolded.toggle()
                                    playingSymbol = "pause.fill"
                                } label: {
                                    Image(systemName: "play.fill")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 25))
                                }
                                
                                if audioManager.player != nil {
                                    Text(DateComponentsFormatter.abbreviated.string(from : audioManager.player!.duration) ?? "--m --s")
                                        .padding(.top,8)
                                        .padding(.bottom,5)
                                        .foregroundColor(.secondary)
                                        .font(.system(size: 13))
                                }
                            }
                            .padding(.top,voiceMessage.isReplying  && voiceMessage.provenance == .me ? 40 : voiceMessage.isReplying  && voiceMessage.provenance == .other ? 50 : !voiceMessage.isReplying  && voiceMessage.provenance == .me ? 20 : !voiceMessage.isReplying  && voiceMessage.provenance == .other ? 20 : 0)
                            .padding(.leading, !voiceMessage.isReplying  && voiceMessage.provenance == .me ? -20 : !voiceMessage.isReplying  && voiceMessage.provenance == .other ? 20 : 0)
                            
                        }else{
                            HStack {
                                Spacer()
                                VStack {
                                    Button {
                                        
                                        // pause and play the message
                                        
                                        audioManager.playPause()
                                        voiceMessage.isPlaying.toggle()
                                        playingSymbol = audioManager.isPlaying ? "pause.fill" : "play.fill"
                                    } label: {
                                        Image(systemName: playingSymbol)
                                            .foregroundColor(.gray)
                                            .font(.system(size: 25))
                                    }
                                    
                                }.onAppear(){
                                    audioManager.startPlayer(messageAudioName: voiceMessage.audio.audioName)
                                 
                                }
                                Spacer()
                             AudioWaveform()
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
                            }.padding(.trailing,voiceMessage.isReplying  && voiceMessage.provenance == .me ? 50 : voiceMessage.isReplying  && voiceMessage.provenance == .other ? 40 : !voiceMessage.isReplying  && voiceMessage.provenance == .me ? 50 : !voiceMessage.isReplying  && voiceMessage.provenance == .other ? 20 : 0)
                                .padding(.leading,voiceMessage.isReplying  && voiceMessage.provenance == .me ? 40 : voiceMessage.isReplying  && voiceMessage.provenance == .other ? 40 : !voiceMessage.isReplying  && voiceMessage.provenance == .me ? 30 : !voiceMessage.isReplying  && voiceMessage.provenance == .other ? 50 : 0)
                                .padding(.top,voiceMessage.isReplying  && voiceMessage.provenance == .me ? 40 : voiceMessage.isReplying  && voiceMessage.provenance == .other ? 40 : !voiceMessage.isReplying  && voiceMessage.provenance == .me ? 20 : !voiceMessage.isReplying  && voiceMessage.provenance == .other ? 20 : 0)
                        }
                        
                        
                    }
                }
        }
        .padding(.leading,voiceMessage.isFolded  && voiceMessage.provenance == .me ? 290 : voiceMessage.isFolded  && voiceMessage.provenance == .other ? -170 : !voiceMessage.isFolded  && voiceMessage.provenance == .me ? 60 : !voiceMessage.isFolded  && voiceMessage.provenance == .other  && voiceMessage.isReplying == true ? 25 : -50)
    }
}

struct TheTimeline : View {
    @EnvironmentObject var audioManager : AudioManager
    let rows = [
        GridItem(.fixed(125)),
        GridItem(.fixed(105)),
        GridItem(.fixed(105)),
        GridItem(.fixed(105))
    ]
    
    var body: some View {
        
        
        Section(content: {
            ScrollView(.horizontal) {
                LazyHGrid(rows: rows,alignment: .bottom,pinnedViews: [.sectionHeaders]) {
                    
                    ForEach(disscuss) { item in
                        
                        BubbleView(voiceMessage:  item).shadow(color: Color(UIColor.systemGray5), radius: 1, x: 0, y: 0)
                        
                        
                    }
                }
            }.frame(height: 440)
            
        }, header: {
            ArianaLine(voiceMessage: disscuss[0])
        })
        
    }
}

struct ArianaLine : View{
    @EnvironmentObject var audioManager : AudioManager
    @State var voiceMessage : Bubble
    var body: some View{
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .foregroundColor(Color("Ariane"))
                .overlay{
                    if audioManager.player != nil {
                        HStack{
                            Text(audioManager.getDate(messageAudioName: voiceMessage.audio.audioName))
                            Spacer()
                            Text(audioManager.getHour(messageAudioName: voiceMessage.audio.audioName))
                        }.padding(.horizontal,15)
                            .fontWeight(.medium)
                            .font(.system(size: 15))
                    }
                }
                .frame(width: 380,height: 25)
        }.padding(.leading,20)
            .padding(.top,0)
            .padding(.bottom,30)
    }
}

struct Header : View {
    @State var moreInfo : Bool = false
    var body: some View {
        ZStack{
            Color(uiColor: .systemGray6)
                .ignoresSafeArea()
            
            Button {
                moreInfo.toggle()
            }label: {
                VStack(alignment: .center) {
                    Spacer()
                    ZStack {
                        Image("Virginie")
                            .resizable()
                            .clipShape(Circle())
                            .scaledToFill()
                            .frame(width: 60,height: 55)
                            .shadow(color:.gray,radius: 2)
                            .padding(.top,180)
                        
                    }
                    HStack {
                        Text("Virginie Rey  ")
                            .font(.footnote)
                            .fontWeight(.light)
                            .foregroundColor(.primary)
                        Image("Chevron")
                            .resizable()
                            .frame(width: 5,height: 8)
                    }
                }
                }.padding(.bottom,10)
            }.sheet(isPresented: $moreInfo) {
            CreditView()
        }
        .toolbar(.hidden, for: .tabBar)
    }
}

