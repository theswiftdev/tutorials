//
//  SubmitButton.swift
//  StackForm
//
//  Created by Tibor Bödecs on 2019. 10. 20..
//  Copyright © 2019. Tibor Bödecs. All rights reserved.
//

import UIKit

class SubmitButton: Button {

    var touchHandler: ((SubmitButton) -> Void)?

    init(id: String, title: String) {
        super.init(id: id)

        self.setTitle(title, for: .normal)
    }

    override func initialize() {
        super.initialize()

        self.setTitleColor(.systemBlue, for: .normal)
        self.addTarget(self, action: #selector(self.touchAction(_:)), for: .touchUpInside)
    }

    @objc func touchAction(_ sender: SubmitButton) {
        self.touchHandler?(sender)
    }
    
    func onTouch(_ handler: @escaping ((SubmitButton) -> Void)) -> Self {
        self.touchHandler = handler
        return self
    }
}
