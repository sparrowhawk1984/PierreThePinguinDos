//
//  Blade.swift
//  PierreThePenguinDos
//
//  Created by Joaquin Hidalgo on 10/9/18.
//  Copyright © 2018 ParanoidWacko. All rights reserved.
//

import Foundation
import SpriteKit

class Blade: SKSpriteNode, GameSprite {
    var textureAtlas: SKTextureAtlas = SKTextureAtlas(named: TextureAtlasName.Enemies.rawValue)
    var initialSize: CGSize = CGSize(width: 185, height: 92)
    var spinAnimation = SKAction()
    
    init() {
        super.init(texture: nil, color: .clear, size: self.initialSize)
        let startTexture = textureAtlas.textureNamed(TextureName.Blade.rawValue)
        self.physicsBody = SKPhysicsBody(texture: startTexture, size: self.initialSize)
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.isDynamic = false
        self.createAnimations()
        self.run(self.spinAnimation)
        
        self.physicsBody?.categoryBitMask = PhysicsCategory.enemy.rawValue
        self.physicsBody?.collisionBitMask = ~PhysicsCategory.damagedPenguin.rawValue
    }
    
    func createAnimations() {
        let spinFrames: [SKTexture] = [
            textureAtlas.textureNamed(TextureName.Blade.rawValue),
            textureAtlas.textureNamed(TextureName.Blade2.rawValue)
        ]
        let spinAction = SKAction.animate(with: spinFrames, timePerFrame: 0.07)
        self.spinAnimation = SKAction.repeatForever(spinAction)
    }
    
    func onTap() {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
