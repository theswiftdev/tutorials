//
//  FadePopAnimator.swift
//  CustomTransition
//
//  Created by Tibor Bödecs on 2018. 04. 26..
//  Copyright © 2018. Tibor Bödecs. All rights reserved.
//

import UIKit

open class FadePopAnimator: CustomAnimator {
    
    let interactionController: UIPercentDrivenInteractiveTransition?
    
    public init(type: TransitionType,
                duration: TimeInterval = 0.25,
                interactionController: UIPercentDrivenInteractiveTransition? = nil) {
        self.interactionController = interactionController
        
        super.init(type: type, duration: duration)
    }

    open override func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard
            let fromViewController = transitionContext.viewController(forKey: .from)
            else {
                return
        }
        
        if self.type == .navigation, let toViewController = transitionContext.viewController(forKey: .to) {
            transitionContext.containerView.insertSubview(toViewController.view, belowSubview: fromViewController.view)
        }

        let duration = self.transitionDuration(using: transitionContext)
        UIView.animate(withDuration: duration, animations: {
            fromViewController.view.alpha = 0
        }, completion: { _ in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        })
    }
}

