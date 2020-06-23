//
//  MainMenuScene.swift
//  Mottu The Invincible
//
//  Created by Mahesh on 6/17/16.
//  Copyright © 2016 Mahesh. All rights reserved.
//

import SpriteKit

class MainMenuScene: SKScene {
    
    private var musicBtn: SKSpriteNode?;
    private let musicOn = SKTexture(imageNamed: "Music On Button");
    private let musicOff = SKTexture(imageNamed: "Music Off Button");

    
    override func didMoveToView(view: SKView) {
        musicBtn = self.childNodeWithName("Music") as? SKSpriteNode!;
        GameManager.instance.initializeGameData();
        //AudioManager.instance.playBGMusic()
        setMusic();
     }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        
        for touch in touches {
            
            let location = touch.locationInNode(self)
            
            if nodeAtPoint(location).name == "Start Game"{
                
                GameManager.instance.gameStartedFromMainMenu = true
                
                let scene = GameplayScene(fileNamed:"GameplayScene")
                scene!.scaleMode = .AspectFill
                self.runAction(SKAction.playSoundFileNamed("Click Sound.wav", waitForCompletion: false));

                self.view?.presentScene(scene!, transition: SKTransition.doorwayWithDuration(1.5))
                
            }

            
            if nodeAtPoint(location).name == "Highscore"{
            
                 self.runAction(SKAction.playSoundFileNamed("Click Sound.wav", waitForCompletion: false));
                let scene = HighscoreScene(fileNamed:"HighscoreScene")
                scene!.scaleMode = .AspectFill
                
                self.view?.presentScene(scene!, transition: SKTransition.doorsOpenVerticalWithDuration(1.5))
            
            }
            
            if nodeAtPoint(location).name == "Option"{
              
                 self.runAction(SKAction.playSoundFileNamed("Click Sound.wav", waitForCompletion: false));
                let scene = OptionScene(fileNamed:"OptionScene")
                scene!.scaleMode = .AspectFill
                
                self.view?.presentScene(scene!, transition: SKTransition.doorsOpenVerticalWithDuration(1.5))
            
            }
            if nodeAtPoint(location) == musicBtn {
                handleMusicButton();
            }

            
        }
    }
    
    private func setMusic() {
        if GameManager.instance.getIsMusicOn() {
            
            if AudioManager.instance.isAudioPlayerInitialized() {
                AudioManager.instance.playBGMusic();
                musicBtn?.texture = musicOff;
            }
        }
    }

        private func handleMusicButton() {
            if GameManager.instance.getIsMusicOn() {
                // the music is playing, turn it off
                AudioManager.instance.stopBGMusic();
                GameManager.instance.setIsMusicOn(false);
                musicBtn?.texture = musicOn;
            } else {
                // the music is not playing, turn it on
                AudioManager.instance.playBGMusic();
                GameManager.instance.setIsMusicOn(true);
                musicBtn?.texture = musicOff;
            }
            GameManager.instance.saveData();
        }

}
