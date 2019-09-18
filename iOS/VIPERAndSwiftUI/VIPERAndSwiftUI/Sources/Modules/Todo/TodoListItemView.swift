//
//  TodoListItemView.swift
//  VIPERAndSwiftUI
//
//  Created by Tibor Bödecs on 2019. 09. 13..
//  Copyright © 2019. Tibor Bödecs. All rights reserved.
//

import Foundation
import SwiftUI

struct TodoListItemView: View {

    @EnvironmentObject var env: TodoEnvironment

    let todo: TodoEntity

    var body: some View {
        VStack(alignment: .leading) {
            Text(self.todo.title).font(.headline)
            if self.todo.completed {
                Text("Completed")
                    .foregroundColor(.green)
            }
            else {
                Text("NOT Completed").font(.body)
                    .foregroundColor(.red)
            }
        }
    }
}
