//
//  ContentView.swift
//  Whatzapp0
//
//  Created by Sarah Ndenbe on 16/11/22.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            TabView{
                StatusView()
                    .tabItem {
                        Label("Status", systemImage: "circle.dashed.inset.filled")
                    }
                CallsView()
                    .tabItem {
                        Label("Calls", systemImage: "phone")
                    }
                CameraView()
                    .tabItem {
                        Label("Camera", systemImage: "camera")
                    }
                ChatView()
                    .tabItem {
                        Label("Chats", systemImage: "person.2.wave.2.fill")
                    }
                SettingsView()
                    .tabItem {
                        Label("Settings", systemImage: "gear")
                    }
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
