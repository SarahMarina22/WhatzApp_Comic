//
//  SingleChatView.swift
//  Whatzapp0
//
//  Created by Sarah Ndenbe on 16/11/22.
//

import SwiftUI

struct SingleChatView: View {
    var body: some View {
        ZStack{
            
            
            VStack {
                ZStack {
                    Circle()
                        .foregroundColor(.pink)
                        .frame(width: 50)
                    Image(systemName: "person.fill")
                        .font(.system(size: 30))
                        .foregroundColor(.white)
                }
                Text("Virginie Rey")
                Spacer()
                Rectangle()
                    .frame(height: 650)
                    .foregroundColor(Color("Color"))
                    .ignoresSafeArea()
                
            }
            
        }//.navigationTitle("Virginie Rey").foregroundColor(.blue)
            .toolbar(.hidden, for: .tabBar)
            
    }
    
}

struct SingleChatView_Previews: PreviewProvider {
    static var previews: some View {
        SingleChatView()
    }
}
