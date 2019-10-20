//
//  UIView+Id.swift
//  StackForm
//
//  Created by Tibor Bödecs on 2019. 10. 20..
//  Copyright © 2019. Tibor Bödecs. All rights reserved.
//

import UIKit

extension UIView {

    var id: String? {
        get {
            return self.accessibilityIdentifier
        }
        set {
            self.accessibilityIdentifier = newValue
        }
    }

    func view(withId id: String) -> UIView? {
        if self.id == id {
            return self
        }
        for view in self.subviews {
            if let view = view.view(withId: id) {
                return view
            }
        }
        return nil
    }
}
