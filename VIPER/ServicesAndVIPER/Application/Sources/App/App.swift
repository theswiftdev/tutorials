//
//  App.swift
//  ServicesAndVIPER
//
//  Created by Tibor Bödecs on 2019. 09. 25..
//  Copyright © 2019. Tibor Bödecs. All rights reserved.
//

import Foundation

final class App {

    let services = ServiceBuilder()

    // MARK: - singleton

    static let shared = App()

    private init() {
        // do nothing...
    }
    
    // MARK: - api

    func setup() {
        self.services.setup()
    }
}
