//
//  TodoEnvironment.swift
//  VIPERAndSwiftUI
//
//  Created by Tibor Bödecs on 2019. 09. 13..
//  Copyright © 2019. Tibor Bödecs. All rights reserved.
//

import Foundation
import Combine

final class TodoEnvironment: ObservableObject {

    let objectWillChange = ObservableObjectPublisher()

    @Published var title: String = "Todo list" {
       willSet {
            self.objectWillChange.send()
        }
    }
}
