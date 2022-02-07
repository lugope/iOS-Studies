//
//  GameScene.swift
//  FlyingBubble
//
//  Created by Lucas Pereira on 04/02/22.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    let player = SKSpriteNode(imageNamed: "bubble")
    
    override func didMove(to view: SKView) {
        //Method, which is called when your game scene is ready to run.
        player.position = CGPoint(x: -400, y: 250)
        addChild(player)
        
        //Adding Physics
        physicsWorld.gravity = CGVector(dx: 0, dy: -5)
        player.physicsBody = SKPhysicsBody(circleOfRadius: player.frame.width/2)
//        player.physicsBody = SKPhysicsBody(texture: player.texture!, size: player.texture!.size())
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //Method, which is called when the user touches the screen.
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //Method, which is called when the user stops touching the screen.
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
    }
}
