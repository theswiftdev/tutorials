//
//  ViewController.swift
//  Layers - Circle
//
//  Created by Tibor Bödecs on 2017. 10. 31..
//  Copyright © 2017. Tibor Bödecs. All rights reserved.
//

import UIKit
import QuartzCore

class ViewController: UIViewController {

    weak var circleView: CircularImageView!
    weak var circleWidthConstraint: NSLayoutConstraint!
    
    override func loadView() {
        super.loadView()
        
        let circleView = CircularImageView(frame: .zero)
        circleView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(circleView)

        let circleWidthConstraint = circleView.widthAnchor.constraint(equalToConstant: 32)
        NSLayoutConstraint.activate([
            circleView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            circleView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            circleWidthConstraint,
            circleView.widthAnchor.constraint(equalTo: circleView.heightAnchor),
        ])
        self.circleView = circleView
        self.circleWidthConstraint = circleWidthConstraint
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        // uncomment this if you don't want to use CABasicAnimation or UIViewPropertyAnimator
        // self.circleView.layer.cornerRadius = round(self.circleView.frame.size.width / 2.0)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // CABasicAnimation
        // self.animateCornerRadius()
        // or
        // UIViewPropertyAnimator
        self.circleView.layer.cornerRadius = 16
        UIViewPropertyAnimator(duration: 2.5, curve: .easeInOut) {
            self.circleView.layer.cornerRadius = 32
        }.startAnimation()

        // plus constraint animation

        self.circleWidthConstraint.constant = 64
        UIView.animate(withDuration: 2.5, animations: {
            self.view.layoutIfNeeded() //NOTE: you have to call this on the superview
        }, completion: nil)
        
    }

    func animateCornerRadius() {
        let animation = CABasicAnimation(keyPath: "cornerRadius")
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        animation.fromValue = 16
        animation.toValue = 32
        animation.duration = 2.5
        
        CATransaction.begin()
        CATransaction.setCompletionBlock {
            self.circleView.layer.cornerRadius = 32
        }
        self.circleView.layer.add(animation, forKey: "cornerRadius")
        CATransaction.commit()
    }
    
}


