//
//  ViewController.swift
//  SpringsAndStruts
//
//  Created by Tibor Bödecs on 2017. 10. 31..
//  Copyright © 2017. Tibor Bödecs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    weak var square: UIView!

    var squareFrame: CGRect {
        let midX = self.view.bounds.midX
        let midY = self.view.bounds.midY
        let size: CGFloat = 64
        return CGRect(x: midX-size/2, y: midY-size/2, width: size, height: size)
    }

    override func loadView() {
        super.loadView()
        
        let square = UIView()
        self.view.addSubview(square)
        self.square = square
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.square.backgroundColor = .yellow
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        self.square.frame = self.squareFrame
    }
}

