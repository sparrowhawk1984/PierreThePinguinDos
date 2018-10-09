//
//  Bats.swift
//  PierreThePenguinDos
//
//  Created by Joaquin Hidalgo on 10/9/18.
//  Copyright © 2018 ParanoidWacko. All rights reserved.
//

import Foundation
import SpriteKit

class Bat: SKSpriteNode, GameSprite {
    var textureAtlas: SKTextureAtlas = SKTextureAtlas(named: "Enemies")
    var initialSize: CGSize = CGSize(width: 44, height: 24)
    var flyAnimation = SKAction()
    
    init() {
        super.init(texture: nil, color: .clear, size: self.initialSize)
        self.physicsBody = SKPhysicsBody(circleOfRadius: size.width / 2)
        self.physicsBody?.affectedByGravity = false
        self.createAnimations()
        self.run(self.flyAnimation)
    }
    
    func createAnimations() {
        let flyFrames: [SKTexture] = [
            textureAtlas.textureNamed("bat"),
            textureAtlas.textureNamed("bat-fly")
        ]
        let flyAction = SKAction.animate(with: flyFrames, timePerFrame: 0.12)
        self.flyAnimation = SKAction.repeatForever(flyAction)
    }
    
    func onTap() {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
