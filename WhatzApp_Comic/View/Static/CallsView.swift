//
//  CallsView.swift
//  WhatzApp
//
//  Created by Sarah Ndenbe on 14/11/22.
//

import SwiftUI

struct CallsView: View {
    @State var pickerFake = true
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
                    Picker("Calls", selection: $pickerFake) {
                        Text("All")
                            .tag(pickerFake)
                        Text("Missed")
                    }.pickerStyle(.segmented)
                        .frame(width: 150)
                    Spacer()
                    Button {
                        //
                    } label: {
                        Image(systemName: "phone.arrow.up.right").font(.title2)
                    }
                }.padding(.horizontal)
                    
                HStack {
                    Text("Calls")
                        .font(.largeTitle)
                        .bold()
                    Spacer()
                }.padding(.horizontal)
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
                }.padding(.horizontal)
                List {
                    ZStack{
                        HStack{
                            ZStack {
                                Circle()
                                    .foregroundColor(Color("BackgroundColor"))
                                    .frame(width: 50)
                                Image(systemName: "link")
                                    .font(.system(size: 20))
                                    .foregroundColor(.accentColor)
                                
                                
                            }
                            HStack(alignment: .firstTextBaseline) {
                                VStack(alignment: .leading){
                                    Text("Create Call Link")
                                        .font(.title3)
                                        .foregroundColor(.accentColor)
                                    Text("Share a link for your WhatsApp call")
                                        .font(.system(size: 15))
                                        .fontWeight(.light)
                                        .foregroundColor(.gray)
                                        .lineLimit(1)
                                }
                            }
                            Spacer()
                        }
                        
                    }
                    Section {
                        VStack {
                            HStack{
                                
                                ZStack {
                                    Circle()
                                        .foregroundColor(.secondary)
                                        .frame(width: 50)
                                    Image(systemName: "person.fill")
                                        .font(.system(size: 30))
                                        .foregroundColor(.white)
                                    
                                    
                                }
                                HStack(alignment: .firstTextBaseline) {
                                    VStack(alignment: .leading){
                                        Text("Manu")
                                            .font(.title3)
                                            .foregroundColor(.red)
                                        Label("Missed \t\t\t\t27/11/2022", systemImage: "phone.fill")
                                            .font(.system(size: 15))
                                            .fontWeight(.regular)
                                            .foregroundColor(.gray)
                                            .labelStyle(.titleAndIcon)
                                        Label("Silenced by Do Not Disturb", systemImage: "moon.fill")
                                            .font(.system(size: 15))
                                            .fontWeight(.regular)
                                            .foregroundColor(.indigo)
                                            .labelStyle(.titleAndIcon)
                                    }
                                }
                                Spacer()
                                VStack {
                                    Spacer()
                                    HStack {
                                        Image(systemName: "info.circle")
                                            .foregroundColor(.accentColor)
                                            .font(.system(size: 25))
                                    }
                                    Spacer()
                                }
                                Spacer()
                            }
                        }
                    }
                }.listStyle(.plain)
                
            }
        }.navigationTitle("Calls")
        
    }
}

struct CallsView_Previews: PreviewProvider {
    static var previews: some View {
        CallsView()
    }
}
