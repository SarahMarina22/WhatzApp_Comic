//
//  SettingsView.swift
//  WhatzApp
//
//  Created by Sarah Ndenbe on 14/11/22.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
            ZStack{
                Color("BackgroundColor").ignoresSafeArea()
                
                VStack {
                    HStack {
                        Button {
                            //
                        } label: {
                            Text(" ").font(.title2)
                        }
                        Spacer()
                    }.padding(.bottom,0.5)
                    
                    HStack {
                        Text("Settings")
                            .font(.largeTitle)
                            .bold()
                        Spacer()
                    }.padding(.horizontal)
                    
                
                    ZStack{
                        Color(.white)
                        HStack(alignment: .center){
                            
                            ZStack {
                                Circle()
                                    .foregroundColor(.gray)
                                    .frame(width: 80)
                                Image(systemName: "person.fill")
                                    .font(.system(size: 65))
                                    .foregroundColor(.white)
                                    .offset(y:5)
                                Image(systemName: "circle")
                                    .font(.system(size: 80))
                                    .foregroundColor(.gray)
                            }
                            HStack(alignment: .firstTextBaseline) {
                                VStack(alignment: .leading){
                                    Text("Sarah").font(.title)
                                    Text("Hey there! I am using WhatsApp")
                                        .fontWeight(.thin)
                                        .lineLimit(1)
                                }
                            }
                            Spacer()
                            ZStack{
                                Circle().foregroundColor(Color("BackgroundColor"))
                                
                                Image(systemName: "qrcode")
                                    .foregroundColor(.accentColor)
                                    .font(.system(size: 25))
                            }.frame(width: 50)
                        }
                        .padding(.horizontal,10)
                        
                    }.frame(height: 75)
                    
                    
                    List {
                        
                        Section {
                            NavigationLink(destination: {
                                CreditView()
                            }, label: {
                                Label("Starred Messages", systemImage: "star")
                            })
                            
                            NavigationLink(destination: {
                                CreditView()
                            }, label: {
                                Label("Linked Devices", systemImage: "laptopcomputer")
                            })
                        }
                        
                        NavigationLink(destination: {
                            CreditView()
                        }, label: {
                            Label("Account", systemImage: "key")
                        })
                        NavigationLink(destination: {
                            CreditView()
                        }, label: {
                            Label("Chats", systemImage: "phone.bubble.left")
                            
                        })
                        NavigationLink(destination: {
                            CreditView()
                        }, label: {
                            Label("Notifications", systemImage: "app.badge.fill")
                        })
                        NavigationLink(destination: {
                            CreditView()
                        }, label: {
                            Label("Storage and Data", systemImage: "arrow.up.arrow.down.square.fill")
                        })
                        Section{
                            NavigationLink(destination: {
                                CreditView()
                            }, label: {
                                Label("Help", systemImage: "info")
                            })
                            NavigationLink(destination: {
                                CreditView()
                            }, label: {
                                Label("Tell a Friend", systemImage: "heart")
                            })
                        }
                    }.listStyle(.grouped)
                   
                }
            }
        
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
