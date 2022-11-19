//
//  ReactionSpriteKit.swift
//  WhatzApp_Comic
//
//  Created by Sarah Ndenbe on 19/11/22.
//

import Foundation
import SpriteKit
import SwiftUI

class ReactionScene: SKScene {
    var reactionName : String = ""
    
    private var reaction = SKSpriteNode()
    
    private var reactionFrames: [SKTexture] = []
    
    override func didMove(to view: SKView) {
        backgroundColor = .systemGray6
        buildReaction()
        animateReaction()
    }
    
    
    
     func buildReaction() {
     let reactionAnimatedAtlas = SKTextureAtlas(named: reactionName)
     var reactionBufferFrames: [SKTexture] = []
     
     let numImages = reactionAnimatedAtlas.textureNames.count
     for i in 0..<numImages {
     let reactionTextureName = "\(reactionName)\(i)"
         reactionBufferFrames.append(reactionAnimatedAtlas.textureNamed(reactionTextureName))
     }
         reactionFrames = reactionBufferFrames
     
     let firstFrameTexture = reactionFrames[0]
     reaction = SKSpriteNode(texture: firstFrameTexture)
     reaction.position = CGPoint(x: frame.midX, y: frame.midY)
  
     addChild(reaction)
     
     }
     
    func animateReaction() {
        if(reactionName == "heart"){
            reaction.run(SKAction.repeatForever(SKAction.animate(with: reactionFrames, timePerFrame: 0.24)),
                     withKey:"heartBeat")
        }else if(reactionName == "like"){
            reaction.run(SKAction.repeatForever(SKAction.animate(with: reactionFrames, timePerFrame: 0.21)),
                     withKey:"iLikeIt")
        }else if(reactionName == "dislike"){
            reaction.run(SKAction.repeatForever(SKAction.animate(with: reactionFrames, timePerFrame: 0.08)),
                         withKey:"iDislikeIt")
        }else if(reactionName == "lol"){
            reaction.run(SKAction.repeatForever(SKAction.animate(with: reactionFrames, timePerFrame: 0.10)),
                         withKey:"funny")
        }else if(reactionName == "wow"){
            reaction.run(SKAction.repeatForever(SKAction.animate(with: reactionFrames, timePerFrame: 0.10)),
                         withKey:"surprised")
        }else{
            reaction.run(SKAction.repeatForever(SKAction.animate(with: reactionFrames, timePerFrame: 0.22)),
                         withKey:"whatThe")
        }
        
       
    }
    
    func copyReaction() -> ReactionScene {
        let reaction = ReactionScene()
        reaction.reactionName = reactionName
        return reaction
    }
}

///  Setting Reactions
var reacScene = ReactionScene()
var heart = reacScene.copyReaction()
var like = reacScene.copyReaction()
var dislike = reacScene.copyReaction()
var lol = reacScene.copyReaction()
var wow = reacScene.copyReaction()
var what = reacScene.copyReaction()



