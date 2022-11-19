//
//  StatusView.swift
//  WhatzApp
//
//  Created by Sarah Ndenbe on 14/11/22.
//

import SwiftUI

struct StatusView: View {
    @State var searchFake = "Search"
    var body: some View {
        ZStack{
            Color("BackgroundColor").ignoresSafeArea()
            
            VStack {
                HStack {
                    Button {
                        //
                    } label: {
                        Text("Privacy").font(.title2)
                    }
                    Spacer()
                }.padding(.bottom,0.5)
                    .padding(.horizontal)
                HStack {
                    Text("Status")
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
                                    .foregroundColor(.gray)
                                    .frame(width: 80)
                                Image(systemName: "person.fill")
                                    .font(.system(size: 65))
                                    .foregroundColor(.white)
                                    .offset(y:5)
                                Image(systemName: "circle")
                                    .font(.system(size: 80))
                                    .fontWeight(.heavy)
                                    .foregroundColor(.gray)
                            }.overlay(
                                VStack{
                                    Spacer()
                                    Image(systemName: "plus.circle.fill")
                                        .foregroundColor(.accentColor)
                                        .background(Color(.white))
                                        .clipShape(Circle())
                                }.font(.system(size: 25))
                                    .offset(x:30,y:-2))
                            HStack(alignment: .firstTextBaseline) {
                                VStack(alignment: .leading){
                                    Text("My Status").font(.headline)
                                    Text("Add to my status")
                                        .fontWeight(.thin)
                                        .lineLimit(1)
                                }
                            }
                            Spacer()
                            ZStack{
                                Circle().foregroundColor(Color("BackgroundColor"))
                                
                                Image(systemName: "camera.fill")
                                    .foregroundColor(.accentColor)
                                    .font(.system(size: 20))
                            }.frame(width: 50)
                            Spacer()
                            ZStack{
                                Circle().foregroundColor(Color("BackgroundColor"))
                                
                                Image(systemName: "pencil")
                                    .foregroundColor(.accentColor)
                                    .font(.system(size: 20))
                                    .fontWeight(.black)
                            }.frame(width: 50)
                        }
                    }
                    Section {
                        VStack {
                            HStack {
                                Spacer()
                                Text("No recent update to show right now.")
                                    .foregroundColor(.gray)
                                Spacer()
                            }
                        }
                    }
                }.listStyle(.grouped)
                
                
            }
        }.navigationTitle("Status")
        
    }
}

struct StatusView_Previews: PreviewProvider {
    static var previews: some View {
        StatusView()
    }
}
