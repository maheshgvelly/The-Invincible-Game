//
//  GameViewController.swift
//  Mottu The Invincible
//
//  Created by Mahesh on 6/7/16.
//  Copyright (c) 2016 Mahesh. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {
    
    var player:Player?
    var moveLeft = false;
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let scene = MainMenuScene(fileNamed:"MainMenu") {
            // Configure the view.
            let skView = self.view as! SKView
            skView.showsFPS = true
            skView.showsNodeCount = true
            
            skView.showsPhysics = true
            
            /* Sprite Kit applies additional optimizations to improve rendering performance */
            skView.ignoresSiblingOrder = true
            
            /* Set the scale mode to scale to fit the window */
            scene.scaleMode = .AspectFill
            
            skView.presentScene(scene)
        }
    }

    override func shouldAutorotate() -> Bool {
        return false
    }

    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            return .AllButUpsideDown
        } else {
            return .All
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    
    //Mark:- Shake Gesture
    override func canBecomeFirstResponder() -> Bool {
        return true
    }
    override func motionBegan(motion: UIEventSubtype, withEvent event: UIEvent?) {
        print("...Shake Begin....")
        
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        if(event!.subtype == UIEventSubtype.MotionShake) {
            
            print("Shake...Shaken....")
            moveLeft = false
            player?.movePlayer(moveLeft)
            
            
        }
    }

}
