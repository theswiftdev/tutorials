//
//  ServiceInteractor.swift
//  ServicesAndVIPER
//
//  Created by Tibor Bödecs on 2019. 09. 25..
//  Copyright © 2019. Tibor Bödecs. All rights reserved.
//

import Foundation

class ServiceInteractor {

    let services: ServiceBuilderInterface

    init(services: ServiceBuilderInterface = App.shared.services) {
        self.services = services
    }
}
