//
//  MyApiService.swift
//  ServicesAndVIPER
//
//  Created by Tibor Bödecs on 2019. 09. 25..
//  Copyright © 2019. Tibor Bödecs. All rights reserved.
//

import Foundation
import Combine

final class MyApiService: ApiServiceInterface {

    let baseUrl: String
    
    init(baseUrl: String) {
        self.baseUrl = baseUrl
    }

    func todos() -> AnyPublisher<[TodoObject], HTTP.Error> {
        let url = URL(string: self.baseUrl + "todos")!
        var request = URLRequest(url: url)
        request.httpMethod = HTTP.Method.get.rawValue.uppercased()

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
        .decode(type: [TodoObject].self, decoder: JSONDecoder())
        .mapError { error -> HTTP.Error in
            if let httpError = error as? HTTP.Error {
                return httpError
            }
            return HTTP.Error.unknown(error)
        }
        .eraseToAnyPublisher()
    }
}
