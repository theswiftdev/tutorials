//
//  ViewController.swift
//  AutoLayout - Constraints
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
        self.view.addConstraints([
            NSLayoutConstraint(item: square, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1.0, constant: 64),
            NSLayoutConstraint(item: square, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1.0, constant: 64),
            NSLayoutConstraint(item: square, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: square, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1.0, constant: 0),
        ])
        self.square = square
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.square.backgroundColor = .yellow
    }
}

