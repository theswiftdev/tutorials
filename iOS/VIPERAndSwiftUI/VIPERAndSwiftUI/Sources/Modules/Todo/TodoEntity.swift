//
//  TaskEntity.swift
//  VIPERAndSwiftUI
//
//  Created by Tibor Bödecs on 2019. 09. 12..
//  Copyright © 2019. Tibor Bödecs. All rights reserved.
//

import Foundation
import SwiftUI

struct TodoEntity: EntityInterface, Codable, Identifiable {
    let id: Int
    let title: String
    let completed: Bool
}
