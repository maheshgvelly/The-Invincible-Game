//
//  Player.swift
//  Mottu The Invincible
//
//  Created by Mahesh on 6/7/16.
//  Copyright © 2016 Mahesh. All rights reserved.
//

import SpriteKit

struct ColliderType {
    
    static let Player: UInt32 = 0
    static let Cloud: UInt32 = 1
    static let darkCloudAndCollectables: UInt32 = 2
}


class Player: SKSpriteNode {
    
    private var textureAtlas = SKTextureAtlas()
    private var playerAnimation = [SKTexture]()
    private var animatePlayerAction = SKAction()
    
    private var lastY = CGFloat()
    
    func initializePlayerAndAnimations() {
        
        textureAtlas = SKTextureAtlas(named: "Player.atlas")
        
        for i in 2...textureAtlas.textureNames.count{
            
            let name = "Player \(i)"
            playerAnimation.append(SKTexture (imageNamed: name))
        }
        animatePlayerAction = SKAction.animateWithTextures(playerAnimation, timePerFrame: 0.08, resize: true, restore: false)
        
        self.physicsBody = SKPhysicsBody(rectangleOfSize: CGSize(width: self.size.width - 7, height: self.size.height - 10))
        self.physicsBody?.affectedByGravity = true
        self.physicsBody?.allowsRotation = false
        self.physicsBody?.restitution = 0
        self.physicsBody?.categoryBitMask = ColliderType.Player
        self.physicsBody?.collisionBitMask = ColliderType.Cloud
        self.physicsBody?.contactTestBitMask = ColliderType.darkCloudAndCollectables
        
        lastY = self.position.y
    }
    
    func animatePlayer(moveLeft:Bool){
        
        if moveLeft{
            self.xScale = -fabs(self.xScale)
        }else{
            self.xScale = fabs(self.xScale)

        }
        
        self.runAction(SKAction.repeatActionForever(animatePlayerAction), withKey: "Animate")
    }
    
    func stopPlayerAnimation() {
        
        self.removeActionForKey("Animate")
        self.texture = SKTexture(imageNamed: "Player 1")
        self.size = (self.texture?.size())!
    }
    
    
        
    func movePlayer(moveLeft:Bool){
        
        if moveLeft {
            
            self.position.x -=  7
        }
        else
        {
            self.position.x += 7
            
        }
        
    }
    
    func setScore() {
        if self.position.y < lastY {
            GameplayController.instance.incrementScore()
            lastY = self.position.y
        }
    }
    

}
