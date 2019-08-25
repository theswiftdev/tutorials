//
//  CustomAnimator.swift
//  CustomTransition
//
//  Created by Tibor Bödecs on 2018. 04. 26..
//  Copyright © 2018. Tibor Bödecs. All rights reserved.
//

import UIKit

open class CustomAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    public enum TransitionType {
        case navigation
        case modal
    }
    
    let type: TransitionType
    let duration: TimeInterval
    
    public init(type: TransitionType, duration: TimeInterval = 0.25) {
        self.type = type
        self.duration = duration
        
        super.init()
    }
    
    open func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return self.duration
    }
    
    open func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        fatalError("You have to implement this method for yourself!")
    }
}
