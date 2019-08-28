//
//  GameViewController.swift
//  SpriteKitBestPractices
//
//  Created by Tibor Bödecs on 2017. 10. 24..
//  Copyright © 2017. Tibor Bödecs. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit


class GameViewController: UIViewController {

    @IBOutlet weak var button: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as? SKView {
            if let scene = SKScene(fileNamed: "GameScene") {
                scene.scaleMode = .aspectFill
                view.presentScene(scene)
            }

            view.ignoresSiblingOrder = true
            view.showsFPS = true
            view.showsNodeCount = true
        }
        
        self.button.setTitle("Pause", for: .normal)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        (self.view as? SKView)?.scene?.size = self.view.bounds.size
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }

    override var shouldAutorotate: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        }
        return .all
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)

        (self.view as? SKView)?.scene?.size = size
    }
    
    @IBAction func buttonTouchedAction(_ sender: Any) {
        guard let view = self.view as? SKView else { return }
        view.isPaused = !view.isPaused
        self.button.setTitle( view.isPaused ? "Resume" : "Pause", for: .normal)
    }
    
}
