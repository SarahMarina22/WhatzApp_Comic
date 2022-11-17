//
//  CameraView.swift
//  WhatzApp
//
//  Created by Sarah Ndenbe on 14/11/22.
//

import SwiftUI
import SpriteKit

struct CameraView: View {
    var body: some View {
        ZStack{ // To animate at open
            Rectangle().foregroundColor(.black)
            VStack {
                HStack {
                    Button {
                        //
                    } label: {
                        Image(systemName: "xmark").foregroundColor(.white)
                    }
                    Spacer()
                    Button {
                        //
                    } label: {
                        Image(systemName: "bolt.slash.fill").foregroundColor(.white)
                    }

                }.padding()
                    .fontWeight(.heavy)
                Spacer()
                
                HStack {
                    Button {
                        //
                    } label: {
                        ZStack {
                            Circle()
                                .foregroundColor(.gray.opacity(0.3))
                                .blur(radius: 0.5)
                                .frame(width: 60)
                                
                            Image(systemName: "photo.fill").foregroundColor(.white)
                                
                        }
                    }
                    Spacer()
                    Button {
                        //
                    } label: {
                        Image(systemName: "circle").foregroundColor(.white)
                            .font(.system(size: 85))
                       
                    }

                    Spacer()
                    Button {
                        //
                    } label: {
                        ZStack {
                            Circle()
                                .foregroundColor(.gray.opacity(0.3))
                                .blur(radius: 0.5)
                                .frame(width: 60)
                            Image(systemName: "camera.rotate.fill").foregroundColor(.white)
                        }
                    }
                }.padding()
                    .font(.system(size: 25))

                Text("Hold for video, tap for photo")
                    .foregroundColor(.white)
                    .font(.footnote)
            }
        }.navigationTitle("Camera")
            .font(.system(size: 20))
        
    }
}

struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView()
    }
}
