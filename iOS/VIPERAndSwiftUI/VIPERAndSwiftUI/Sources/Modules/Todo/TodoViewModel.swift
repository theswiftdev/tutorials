//
//  TaskView.swift
//  VIPERAndSwiftUI
//
//  Created by Tibor Bödecs on 2019. 09. 12..
//  Copyright © 2019. Tibor Bödecs. All rights reserved.
//

import Combine
import SwiftUI

final class TodoViewModel: ObservableObject {
 
    let objectWillChange = ObservableObjectPublisher()
   
    @Published var error: Bool = false {
        willSet {
            self.objectWillChange.send()
        }
    }

    @Published var todos: [TodoEntity] = [] {
       willSet {
            self.objectWillChange.send()
        }
    }
}
