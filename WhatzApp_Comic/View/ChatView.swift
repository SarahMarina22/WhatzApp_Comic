//
//  ChatView.swift
//  WhatzApp
//
//  Created by Sarah Ndenbe on 14/11/22.
//

import SwiftUI

struct ChatView: View {
    @State var searchFake = "Search"
    var body: some View {
            ZStack{
                VStack {
                    HStack {
                        Button {
                            //
                        } label: {
                            Text("Edit").font(.title2)
                        }
                        Spacer()
                        Button {
                            //
                        } label: {
                            Image(systemName: "mic.fill").font(.title2)
                        }
                    }.padding(.horizontal).padding(.bottom,0.5)
                    VStack {
                        VStack {
                            HStack {
                                Text("Chats")
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                                    .bold()
                                Spacer()
                            }
                            HStack {
                                ZStack{
                                    RoundedRectangle(cornerRadius: 15)
                                        .frame(height: 40)
                                        .foregroundColor(Color(red: 0.90, green: 0.90, blue: 0.90))
                                    HStack {
                                        
                                        Label("Search", systemImage: "magnifyingglass")
                                            .labelStyle(.iconOnly)
                                            .foregroundColor(.secondary)
                                            .font(.system(size: 20))
                                        TextField("Search", text: $searchFake)
                                            .foregroundColor(.gray)
                                        Spacer()
                                    }.padding(.horizontal)
                                }
                                Button {
                                    //
                                } label: {
                                    Image(systemName: "line.horizontal.3.decrease").font(.title2)
                                }
                                
                            }
                            
                            HStack {
                                Button {
                                    //
                                } label: {
                                    Text("Broadcast Lists").font(.title2)
                                }
                                Spacer()
                                Button {
                                    //
                                } label: {
                                    Text("New Group").font(.title2)
                                }
                            }.padding(.top)
                        }
                        //Spacer()
                    }.padding(.horizontal)
                    List {
                        NavigationLink(destination: {
                            SingleChatView()
                        }, label: {
                            VStack {
                                HStack{
                                    ZStack {
                                        Circle()
                                            .foregroundColor(.pink)
                                            .frame(width: 50)
                                        Image(systemName: "person.fill")
                                            .font(.system(size: 30))
                                            .foregroundColor(.white)
                                    }
                                    HStack{
                                        VStack(alignment: .leading){
                                            HStack {
                                                Text("Virginie Rey")
                                                    .font(.title3)
                                                    .bold()
                                                Spacer()
                                                Text("Today")
                                                    .foregroundColor(.gray)
                                                    .font(.system(size: 20))
                                                    .fontWeight(.regular)
                                                
                                            }
                                            Text("recording an audio...")
                                                .font(.system(size: 15))
                                                .italic()
                                                .fontWeight(.regular)
                                                .foregroundColor(.gray)
                                                
                                        }
                                    }
                                }
                            }
                        })
                        VStack {
                            HStack{
                                ZStack {
                                    Circle()
                                        .foregroundColor(.blue)
                                        .frame(width: 50)
                                    Image(systemName: "person.fill")
                                        .font(.system(size: 30))
                                        .foregroundColor(.white)
                                }
                                HStack{
                                    VStack(alignment: .leading){
                                        HStack {
                                            Text("Manu")
                                                .font(.title3)
                                                .bold()
                                            Spacer()
                                            Text("Thursday")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 20))
                                                .fontWeight(.regular)
                                            
                                        }
                                        Text("Okok no problem")
                                            .font(.system(size: 15))
                                            .fontWeight(.regular)
                                            .foregroundColor(.gray)
                                            .labelStyle(.titleAndIcon)
                                    }
                                }
                            }
                        }
                        VStack {
                            HStack{
                                ZStack {
                                    Circle()
                                        .foregroundColor(.green)
                                        .frame(width: 50)
                                    Image(systemName: "person.fill")
                                        .font(.system(size: 30))
                                        .foregroundColor(.white)
                                }
                                HStack{
                                    VStack(alignment: .leading){
                                        HStack {
                                            Text("Jo")
                                                .font(.title3)
                                                .bold()
                                            Spacer()
                                            Text("04/11/22")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 20))
                                                .fontWeight(.regular)
                                            
                                        }
                                        Text("?")
                                            .font(.system(size: 15))
                                            .fontWeight(.regular)
                                            .foregroundColor(.gray)
                                            .labelStyle(.titleAndIcon)
                                    }
                                }
                            }
                        }
                    }.listStyle(.plain)
                }
            }//.navigationTitle("Chats")
        
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
