//
//  JSONPlaceholderService.swift
//  VIPER best practices
//
//  Created by Tibor Bödecs on 2019. 03. 05..
//  Copyright © 2019. Tibor Bödecs. All rights reserved.
//

import Foundation

class JSONPlaceholderService {
    
    var baseUrl = URL(string: "https://jsonplaceholder.typicode.com/")!
    
    enum Error: LocalizedError {
        case invalidStatusCode
        case emptyData
    }
    
    private func request<T>(path: String) -> Promise<T> where T: Decodable {
        let promise = Promise<T>()
        let url = baseUrl.appendingPathComponent(path)
        print(url)
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                promise.reject(error)
                return
            }
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                promise.reject(Error.invalidStatusCode)
                return
            }
            guard let data = data else {
                promise.reject(Error.emptyData)
                return
            }
            do {
                let model = try JSONDecoder().decode(T.self, from: data)
                promise.fulfill(model)
            }
            catch {
                promise.reject(error)
            }
        }.resume()
        return promise
    }
}

extension JSONPlaceholderService: ApiService {

    func posts() -> Promise<[Post]> {
        return self.request(path: "posts")
    }
    
    func comments(for post: Post) -> Promise<[Comment]> {
        return self.request(path: "posts/\(post.id)/comments")
    }
    
    func albums() -> Promise<[Album]> {
        return self.request(path: "albums")
    }
    
    func photos(for album: Album) -> Promise<[Photo]> {
        return self.request(path: "albums/\(album.id)/photos")
    }
    
    func todos() -> Promise<[Todo]> {
        return self.request(path: "todos")
    }
}
