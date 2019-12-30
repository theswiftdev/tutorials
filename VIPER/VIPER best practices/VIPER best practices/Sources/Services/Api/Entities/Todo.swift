//
//  Todo.swift
//  VIPER best practices
//
//  Created by Tibor Bödecs on 2019. 03. 05..
//  Copyright © 2019. Tibor Bödecs. All rights reserved.
//

import Foundation

struct Todo: Codable {

    let id: Int
    let title: String
    let completed: Bool
}
