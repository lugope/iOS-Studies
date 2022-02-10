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
        
        //Adding background
        parallaxScroll(image: "background3", y: 0, z: -3, duration: 18, needsPhysics: false)
        parallaxScroll(image: "background2", y: 0, z: -2, duration: 8, needsPhysics: false)
        parallaxScroll(image: "background1", y: 0, z: -1, duration: 4, needsPhysics: false)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //Method, which is called when the user touches the screen.
        player.physicsBody?.velocity = CGVector(dx: 0, dy: 300)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //Method, which is called when the user stops touching the screen.
    }
    
    // Makes parallax happens
    func parallaxScroll(image: String, y: CGFloat, z: CGFloat, duration: Double, needsPhysics: Bool) {
        for i in 0 ... 1 {
            let node = SKSpriteNode(imageNamed: image)
            
            //position first node on the left and the secound on the right
            node.position = CGPoint(x: 1023 * CGFloat(i), y: y)
            node.zPosition = z
            addChild(node)
            
            //make this node move the width of the screen by a duration
            let move = SKAction.moveBy(x: -1024, y: 0, duration: duration)
            //make it jump back to the right edge
            let wrap = SKAction.moveBy(x: 1024, y: 0, duration: 0)
            
            //make these two as a sequence that loops forever
            let sequence = SKAction.sequence([move, wrap])
            let forever = SKAction.repeatForever(sequence)
            
            //run animations
            node.run(forever)
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
    }
}
