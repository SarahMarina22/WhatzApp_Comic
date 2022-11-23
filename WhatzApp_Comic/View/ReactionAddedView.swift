//
//  ReactionAddedView.swift
//  WhatzApp_Comic
//
//  Created by Sarah Ndenbe on 23/11/22.
//

import SwiftUI

struct ReactionAddedView: View {
    var aReaction : String
    var body: some View {
       Image(aReaction)
            .resizable()
            .frame(width:20,height:20)
    }
}

struct ReactionAddedView_Previews: PreviewProvider {
    static var previews: some View {
        ReactionAddedView(aReaction: "heart0")
    }
}
