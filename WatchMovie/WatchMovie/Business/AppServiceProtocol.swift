//
//  AppServiceProtocols.swift
//  WatchMovie
//
//  Created by Khalil Mhelheli on 23/9/2022.
//

import Foundation

public protocol AppServiceProtocol {
    typealias ServiveError = NetworkingServiceError
    init(baseURL: URL, client: HTTPClient, apiKey: String)
    
    
    // MARK: - Browse
    func getMostPopularMovies(completion: @escaping (Swift.Result<MostPopularData, ServiveError>) -> Void)
    func getMostPopularTvs(completion: @escaping (Swift.Result<MostPopularData, ServiveError>) -> Void)
    
    // MARK: - Title
    func getTitle(for id: String, completion: @escaping (Swift.Result<TitleData, ServiveError>)-> Void )
}

public class MovieApiService: AppServiceProtocol {
    
    private var baseURL: URL
    private var client: HTTPClient
    var apiKey: String
    
    public required init(baseURL: URL, client: HTTPClient, apiKey: String) {
        self.baseURL = baseURL
        self.client = client
        self.apiKey = apiKey
    }
    public func getMostPopularMovies(completion: @escaping (Result<MostPopularData, ServiveError>) -> Void) {
        let url = baseURL.appendingPathComponent("API/MostPopularMovies").appendingPathComponent(apiKey)
        client.makeRequest(toURL: url, withHttpMethod: .get) { [weak self]result in
            guard self != nil else { return}
            completion(GenericDecoder.decodeResult(result: result))
        }
    }
    
    public func getMostPopularTvs(completion: @escaping (Result<MostPopularData, ServiveError>) -> Void) {
        let url = baseURL.appendingPathComponent("API/MostPopularTVs").appendingPathComponent(apiKey)
        client.makeRequest(toURL: url, withHttpMethod: .get) { [weak self] result in
            guard self != nil else { return }
            
            completion(GenericDecoder.decodeResult(result: result))
        }
    }
    
    public func getTitle(for id: String, completion: @escaping (Result<TitleData, ServiveError>) -> Void) {
        let url = baseURL.appendingPathComponent("API/Title").appendingPathComponent(apiKey).appendingPathComponent(id)
        client.makeRequest(toURL: url, withHttpMethod: .get) { [weak self] result in
            guard self != nil else {return}
            completion(GenericDecoder.decodeResult(result: result))
        }
    }
    
    
    
}
