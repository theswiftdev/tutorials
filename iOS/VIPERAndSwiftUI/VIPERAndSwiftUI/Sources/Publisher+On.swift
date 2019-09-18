//
//  Publisher+On.swift
//  VIPERAndSwiftUI
//
//  Created by Tibor Bödecs on 2019. 09. 16..
//  Copyright © 2019. Tibor Bödecs. All rights reserved.
//

import Foundation
import Combine

public extension Publisher {

    func on(queue: DispatchQueue) -> Publishers.ReceiveOn<Self, DispatchQueue> {
        self.receive(on: queue, options: nil)
    }

    func on(success: @escaping ((Self.Output) -> Void),
            failure: @escaping ((Self.Failure) -> Void)) -> AnyCancellable {
        self.sink(receiveCompletion: { completion in
            switch completion {
            case .failure(let error):
                failure(error)
            case .finished:
                break
            }
        }, receiveValue: success)
    }
}
