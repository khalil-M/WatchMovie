//
//  AppManagerProtocol.swift
//  WatchMovie
//
//  Created by Khalil Mhelheli on 23/9/2022.
//

import Foundation

public protocol AppManagerProtocol {
    typealias ServiveError = NetworkingServiceError
    init(service: AppServiceProtocol)
    
    // MARK: - Browse
    func getMostPopularMovies(completion: @escaping (Swift.Result<MostPopularData, ServiveError>) -> Void)
    func getMostPopularTvs(completion: @escaping (Swift.Result<MostPopularData, ServiveError>) -> Void)
    
}

public class AppManager: AppManagerProtocol {
    
    
    var service: AppServiceProtocol
    required public init(service: AppServiceProtocol) {
        self.service = service
    }
   
    public func getMostPopularMovies(completion: @escaping (Result<MostPopularData, ServiveError>) -> Void) {
        service.getMostPopularMovies { result in
            switch result {
            case .failure(let error):
                print(error)
                break
            case .success(_):
                completion(result)
                break
            }
        }
    }
    
    public func getMostPopularTvs(completion: @escaping (Result<MostPopularData, ServiveError>) -> Void) {
        service.getMostPopularTvs { result in
            switch result {
            case .failure(let error):
                print(error)
                break
            case .success(_):
                completion(result)
                break
            }
        }
    }
    
    
}
