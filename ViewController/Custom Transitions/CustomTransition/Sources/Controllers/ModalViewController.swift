//
//  ModalViewController.swift
//  CustomTransition
//
//  Created by Tibor Bödecs on 2018. 04. 25..
//  Copyright © 2018. Tibor Bödecs. All rights reserved.
//

import UIKit

class ModalViewController: UIViewController {
    
    var interactionController: LeftEdgeInteractionController?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .orange
        
        self.interactionController = LeftEdgeInteractionController(viewController: self)
    }

    @IBAction func dismiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
