//
//  MainContainer.swift
//  SwinjectDemoProject
//
//  Created by Felipe Florencio Garcia on 20/02/2019.
//  Copyright © 2019 Felipe Florencio Garcia. All rights reserved.
//

import Foundation
import Swinject

class MainContainer {
    
    static let sharedContainer = MainContainer()
    
    let container = Container()
    
    private init() {
        setupDefaultContainers()
    }
    
    private func setupDefaultContainers() {
        
        container.register(Networking.self, factory: { _ in HTTPNetworking() })
        
        container.register(AppServiceProtocol.self, factory: { resolver in
            return MovieApiService(networking: resolver.resolve(Networking.self)!, serviceConfiguration: .mostPopularMovies)
        })
        
        container.register(AppManagerProtocol.self, factory: { resolver in
            return AppManager(service: resolver.resolve(AppServiceProtocol.self)!)
        })
    }
}
