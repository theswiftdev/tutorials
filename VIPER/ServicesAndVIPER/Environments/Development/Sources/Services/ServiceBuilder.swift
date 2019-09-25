//
//  ServiceBuilder.swift
//  ServicesAndVIPER
//
//  Created by Tibor Bödecs on 2019. 09. 25..
//  Copyright © 2019. Tibor Bödecs. All rights reserved.
//

import Foundation

final class ServiceBuilder: ServiceBuilderInterface {

    lazy var api: ApiServiceInterface = {
        // this can be the url of the development server
        MyApiService(baseUrl: "https://jsonplaceholder.typicode.com")
    }()
}
