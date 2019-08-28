//
//  ViewController.swift
//  AutoLayout - VFL
//
//  Created by Tibor Bödecs on 2017. 10. 31..
//  Copyright © 2017. Tibor Bödecs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    weak var square: UIView!
    
    override func loadView() {
        super.loadView()
        
        let square = UIView()
        self.view.addSubview(square)
        square.translatesAutoresizingMaskIntoConstraints = false

        let views: [String: Any] = ["view": self.view!, "subview": square]
        let vertical = NSLayoutConstraint.constraints(withVisualFormat: "V:[view]-(<=1)-[subview(==64)]",
                                                      options: .alignAllCenterX,
                                                      metrics: nil,
                                                      views: views)

        let horizontal = NSLayoutConstraint.constraints(withVisualFormat: "H:[view]-(<=1)-[subview(==64)]",
                                                        options: .alignAllCenterY,
                                                        metrics: nil,
                                                        views: views)
        self.view.addConstraints(vertical)
        self.view.addConstraints(horizontal)
        self.square = square
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.square.backgroundColor = .yellow
    }
}

