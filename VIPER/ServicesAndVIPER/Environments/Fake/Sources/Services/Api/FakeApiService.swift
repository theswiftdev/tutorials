//
//  FakeApiService.swift
//  ServicesAndVIPER
//
//  Created by Tibor Bödecs on 2019. 09. 25..
//  Copyright © 2019. Tibor Bödecs. All rights reserved.
//

import Foundation
import Combine

final class FakeApiService: ApiServiceInterface {

    var delay: TimeInterval

    init(delay: TimeInterval = 1) {
        self.delay = delay
    }

    private func fakeRequest<T>(response: T) -> AnyPublisher<T, HTTP.Error> {
        return Future<T, HTTP.Error> { promise in
            promise(.success(response))
        }
        .delay(for: .init(self.delay), scheduler: RunLoop.main)
        .eraseToAnyPublisher()
    }

    func todos() -> AnyPublisher<[TodoObject], HTTP.Error> {
        let todos = [
            TodoObject(id: 1, title: "first", completed: false),
            TodoObject(id: 2, title: "second", completed: false),
            TodoObject(id: 3, title: "third", completed: false),
        ]
        return self.fakeRequest(response: todos)
    }
}
