//
//  TodoObject.swift
//  ServicesAndVIPER
//
//  Created by Tibor Bödecs on 2019. 09. 25..
//  Copyright © 2019. Tibor Bödecs. All rights reserved.
//

import Foundation

struct TodoObject: Codable {
    let id: Int
    let title: String
    let completed: Bool
}
