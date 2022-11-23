//
//  CreditView.swift
//  WhatzApp_Comic
//
//  Created by Sarah Ndenbe on 17/11/22.
//

import SwiftUI

struct CreditView: View {
    var body: some View {
        Text("CREDIT DESIGN : WhatsApp & *Sarah Marina*\n\nCREDIT CODE : \n*Sarah Marina with the help of \nPaul Hudson, DesignCode for audio player, Sai Durga Mahesh for extension URL Apple WWDC*\n\nCREDIT PHOTO : *Brooke Cagle*")
            .bold()
            .padding()
    }
}

struct CreditView_Previews: PreviewProvider {
    static var previews: some View {
        CreditView()
    }
}
