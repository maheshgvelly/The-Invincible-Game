//
//  BGClass.swift
//  Mottu The Invincible
//
//  Created by Mahesh on 6/14/16.
//  Copyright © 2016 Mahesh. All rights reserved.
//

import SpriteKit


class BGClass:SKSpriteNode{
    
    
    
    func moveBG (camera:SKCameraNode){
        
        if self.position.y - self.size.height - 10 > camera.position.y {
            
            self.position.y -= self.size.height * 3
        }
        
    }
    
    
    
    
    
    
    
    
    
}
