//
//  ServiceBuilderInterface.swift
//  ServicesAndVIPER
//
//  Created by Tibor Bödecs on 2019. 09. 25..
//  Copyright © 2019. Tibor Bödecs. All rights reserved.
//

import Foundation

protocol ServiceBuilderInterface {

    var api: ApiServiceInterface { get }
    
    func setup()
}

extension ServiceBuilderInterface {
    
    func setup() {
        self.api.setup()
    }
}
