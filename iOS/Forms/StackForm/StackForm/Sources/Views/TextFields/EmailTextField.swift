//
//  EmailTextField.swift
//  StackForm
//
//  Created by Tibor Bödecs on 2019. 10. 20..
//  Copyright © 2019. Tibor Bödecs. All rights reserved.
//

import UIKit

class EmailTextField: TextField {

    override func initialize() {
        super.initialize()
        
        self.keyboardType = .emailAddress
    }
}
