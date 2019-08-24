//
//  GameScene.swift
//  SpriteKitBestPractices
//
//  Created by Tibor Bödecs on 2017. 10. 24..
//  Copyright © 2017. Tibor Bödecs. All rights reserved.
//

import SpriteKit


class GameScene: SKScene {
    
    private var label: SKLabelNode?
    private var spinnyNode: SKShapeNode?

    func createGradient() {
        let texture = SKTexture(size: self.size, startColor: .red, endColor: .blue)
        let node = SKSpriteNode(texture: texture)
        node.size = self.size
        node.position = .zero
        node.zPosition = 1
        self.addChild(node)
    }

    func markCorners() {
        let size = CGSize(width: 32, height: 32)

        let topLeft = SKSpriteNode(texture: nil, color: .red, size: size)
        topLeft.position = CGPoint(x:-1*(self.size.width/2-16), y:self.size.height/2-16);
        topLeft.zPosition = 2
        self.addChild(topLeft)
        
        let topRight = SKSpriteNode(texture: nil, color: .green, size: size)
        topRight.position = CGPoint(x:self.size.width/2-16, y:self.size.height/2-16);
        topRight.zPosition = 2
        self.addChild(topRight)

        let bottomRight = SKSpriteNode(texture: nil, color: .blue, size: size)
        bottomRight.position = CGPoint(x:self.size.width/2-16, y:-1*(self.size.height/2-16));
        bottomRight.zPosition = 2
        self.addChild(bottomRight)
        
        let bottomLeft = SKSpriteNode(texture: nil, color: .yellow, size: size)
        bottomLeft.position = CGPoint(x:-1*(self.size.width/2-16), y:-1*(self.size.height/2-16));
        bottomLeft.zPosition = 2
        self.addChild(bottomLeft)
    }

    override func didMove(to view: SKView) {
        super.didMove(to: view)

    }
    
    override func didChangeSize(_ oldSize: CGSize) {
        super.didChangeSize(oldSize)

        guard oldSize != self.size else { return }

        self.label = self.childNode(withName: "//helloLabel") as? SKLabelNode
        if let label = self.label {
            label.zPosition = 3
            label.run(SKAction.repeatForever(SKAction.rotate(byAngle: .pi, duration: 10)))
        }

        let w = (self.size.width + self.size.height) * 0.05
        self.spinnyNode = SKShapeNode.init(rectOf: CGSize(width: w, height: w), cornerRadius: w * 0.3)
        
        if let spinnyNode = self.spinnyNode {
            spinnyNode.zPosition = 3
            spinnyNode.lineWidth = 2.5
            spinnyNode.run(SKAction.repeatForever(SKAction.rotate(byAngle: .pi, duration: 1)))
            spinnyNode.run(SKAction.sequence([SKAction.wait(forDuration: 0.5),
                                              SKAction.fadeOut(withDuration: 0.5),
                                              SKAction.removeFromParent()]))
        }

        self.createGradient()
        self.markCorners()
    }
    
    func touchDown(atPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.green
            self.addChild(n)
        }
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.blue
            self.addChild(n)
        }
    }
    
    func touchUp(atPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.red
            self.addChild(n)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let label = self.label {
            label.run(SKAction.init(named: "Pulse")!, withKey: "fadeInOut")
        }
        
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
