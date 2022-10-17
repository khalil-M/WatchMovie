//
//  AppManagerProtocol.swift
//  WatchMovie
//
//  Created by Khalil Mhelheli on 23/9/2022.
//

import Foundation

public protocol AppManagerProtocol {
    typealias ServiceError = NetworkingServiceError
    init(service: AppServiceProtocol)
    
    // MARK: - Browse
    func getMostPopularMovies(completion: @escaping (Swift.Result<MostPopularData, ServiceError>) -> Void)
    func getMostPopularTvs(completion: @escaping (Swift.Result<MostPopularData, ServiceError>) -> Void)
    
    // MARK: - Title
    func getTitle(for id: String, completion: @escaping (Swift.Result<TitleData, ServiceError>)-> Void )
    
}

public class AppManager: AppManagerProtocol {
    
    
    var service: AppServiceProtocol
    required public init(service: AppServiceProtocol) {
        self.service = service
    }
   
    public func getMostPopularMovies(completion: @escaping (Result<MostPopularData, ServiceError>) -> Void) {
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
    
    public func getMostPopularTvs(completion: @escaping (Result<MostPopularData, ServiceError>) -> Void) {
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
    
    public func getTitle(for id: String, completion: @escaping (Result<TitleData, ServiceError>) -> Void) {
        service.getTitle(for: id) { result in
            switch result {
            case let .failure(error):
                print(error)
                break
            case .success(_):
                completion(result)
                break
            }
        }
    }
        
}
