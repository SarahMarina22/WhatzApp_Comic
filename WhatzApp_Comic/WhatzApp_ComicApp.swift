//
//  WhatzApp_ComicApp.swift
//  WhatzApp_Comic
//
//  Created by Sarah Ndenbe on 17/11/22.
//

import SwiftUI

@main
struct WhatzApp_ComicApp: App {
    @StateObject var audioManager = AudioManager()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(audioManager)
        }
    }
}
