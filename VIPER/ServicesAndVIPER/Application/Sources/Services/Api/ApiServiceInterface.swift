//
//  ApiServiceInterface.swift
//  ServicesAndVIPER
//
//  Created by Tibor Bödecs on 2019. 09. 25..
//  Copyright © 2019. Tibor Bödecs. All rights reserved.
//

import Foundation
import Combine

protocol ApiServiceInterface: ServiceInterface {

    func todos() -> AnyPublisher<[TodoObject], HTTP.Error>
}
