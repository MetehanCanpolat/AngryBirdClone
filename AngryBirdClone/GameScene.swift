//
//  GameScene.swift
//  AngryBirdClone
//
//  Created by Metehan Canpolat on 31.03.2024.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var bird = SKSpriteNode()
    var box1 = SKSpriteNode()
    var box2 = SKSpriteNode()
    var box3 = SKSpriteNode()
    var box4 = SKSpriteNode()
    var box5 = SKSpriteNode()
    
    
    override func didMove(to view: SKView) {
        
        /* let texture = SKTexture(imageNamed: "bird")
        bird2 = SKSpriteNode(texture: texture)
        bird2.position = CGPoint(x: 0, y: 0)
        
        //cihaz boyutlarına uygun bie yapıda olması için self.frame. i kullanmak mantıklı
        bird2.size = CGSize(width: self.frame.width / 16, height: self.frame.height / 10)
        bird2.zPosition = 1
        self.addChild(bird2) */
        
        //fiziksel dünyayı ekranla sınırlama;
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        
        //BIRD
        
        bird = childNode(withName: "bird") as! SKSpriteNode
        
        let birdTexture = SKTexture(imageNamed: "bird")
        
        bird.physicsBody = SKPhysicsBody(circleOfRadius: birdTexture.size().height / 13)
        
        //yer çekiminden etkilenecek mi?
        bird.physicsBody?.affectedByGravity = false
        
        //fiziksel simülasyonlardan etkilenecek mi?
        bird.physicsBody?.isDynamic = true
        
        //kütlesi
        bird.physicsBody?.mass = 0.15 //kilo cinsinden
    
        //BOXES
        
        let boxTexture = SKTexture(imageNamed: "brick")
        
        let size = CGSize(width: boxTexture.size().width / 5, height: boxTexture.size().height / 5)

        func setupBoxPhysics(name: String) {
            if let box = childNode(withName: name) as? SKSpriteNode {
                box.physicsBody = SKPhysicsBody(rectangleOf: box.size)
                box.physicsBody?.isDynamic = true
                box.physicsBody?.affectedByGravity = true
                //sağ sola dönsün mü;
                box.physicsBody?.allowsRotation = true
                box.physicsBody?.mass = 0.10
            }
        }
        setupBoxPhysics(name: "box1")
        setupBoxPhysics(name: "box2")
        setupBoxPhysics(name: "box3")
        setupBoxPhysics(name: "box4")
        setupBoxPhysics(name: "box5")
        
        
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
 
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
      
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        bird.physicsBody?.applyImpulse(CGVector(dx: 100, dy: 100))
        bird.physicsBody?.affectedByGravity = true
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
