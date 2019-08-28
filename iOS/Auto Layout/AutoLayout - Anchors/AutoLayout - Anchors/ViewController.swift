//
//  ViewController.swift
//  AutoLayout - Anchors
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
        NSLayoutConstraint.activate([
            square.widthAnchor.constraint(equalToConstant: 64),
            square.heightAnchor.constraint(equalToConstant: 64),
            square.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            square.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
        ])
        self.square = square
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.square.backgroundColor = .yellow
    }
}

