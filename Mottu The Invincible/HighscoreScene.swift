//
//  HighscoreScene.swift
//  Mottu The Invincible
//
//  Created by Mahesh on 6/20/16.
//  Copyright © 2016 Mahesh. All rights reserved.
//

import SpriteKit


class HighscoreScene:SKScene{
    
    private var scoreLabel: SKLabelNode?;
    private var coinLabel: SKLabelNode?;
    
    override func didMoveToView(view: SKView) {
        getReference();
        setScore();
    }
    
    private func getReference() {
        scoreLabel = self.childNodeWithName("Score Label") as? SKLabelNode!;
        coinLabel = self.childNodeWithName("Coin Label") as? SKLabelNode!;
    }
    
    private func setScore() {
        if GameManager.instance.getEasyDifficulty() == true {
            
            scoreLabel?.text = String(GameManager.instance.getEasyDifficultyScore());
            
            coinLabel?.text = String(GameManager.instance.getEasyDifficultyCoinScore());
            
        } else if GameManager.instance.getMediumDifficulty() == true {
            
            scoreLabel?.text = String(GameManager.instance.getMediumDifficultyScore());
            
            coinLabel?.text = String(GameManager.instance.getMediumDifficultyCoinScore());
            
        } else if GameManager.instance.getHardDifficulty() == true {
            
            scoreLabel?.text = String(GameManager.instance.getHardDifficultyScore());
            
            coinLabel?.text = String(GameManager.instance.getHardDifficultyCoinScore());
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        for touch in touches {
            let location = touch.locationInNode(self);
            
            if nodeAtPoint(location).name == "Back" {
                let scene = MainMenuScene(fileNamed: "MainMenu");
                scene!.scaleMode = .AspectFill
                
                self.view?.presentScene(scene!, transition: SKTransition.doorsCloseVerticalWithDuration(1));
            }
            
        }
        
    }
    
}

