//
//  TaskInteractor.swift
//  VIPERAndSwiftUI
//
//  Created by Tibor Bödecs on 2019. 09. 12..
//  Copyright © 2019. Tibor Bödecs. All rights reserved.
//

import Foundation
import Combine

final class TodoInteractor: InteractorInterface {

    weak var presenter: TodoPresenterInteractorInterface!
}

extension TodoInteractor: TodoInteractorPresenterInterface {

    func requestPublisher() -> AnyPublisher<[TodoEntity], HTTP.Error> {
        let url = URL(string: "https://jsonplaceholder.typicode.com/todos")!
        let request = URLRequest(url: url)
        return URLSession.shared.dataTaskPublisher(for: request)
        .tryMap { data, response in
            guard let httpResponse = response as? HTTPURLResponse else {
                throw HTTP.Error.invalidResponse
            }
            guard httpResponse.statusCode == 200 else {
                throw HTTP.Error.statusCode(httpResponse.statusCode)
            }
            return data
        }
        .decode(type: [TodoEntity].self, decoder: JSONDecoder())
        .mapError { error -> HTTP.Error in
            if let httpError = error as? HTTP.Error {
                return httpError
            }
            return HTTP.Error.unknown(error)
        }
        .eraseToAnyPublisher()
    }
}
