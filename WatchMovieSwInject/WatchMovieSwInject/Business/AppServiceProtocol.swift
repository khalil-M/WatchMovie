//
//  AppServiceProtocols.swift
//  WatchMovie
//
//  Created by Khalil Mhelheli on 23/9/2022.
//

import Foundation
protocol AppServiceProtocol {
    
    func getMostPopularMovies(response: @escaping (MostPopularData?) -> Void)
}
 
class MovieApiService: AppServiceProtocol {
    
    let networking: Networking
    let serviceConfiguration: AppServiceConfiguration
    
    init(networking: Networking, serviceConfiguration: AppServiceConfiguration) {
        self.networking = networking
        self.serviceConfiguration = serviceConfiguration
    }

    func getMostPopularMovies(response: @escaping (MostPopularData?) -> Void) {
        networking.request(from: self.serviceConfiguration) { data, error in
            if let error = error {
                print("Error received ")
                response(nil)
            }
            let decode = self.decodeJSON(type: MostPopularData.self, from: data)
            if let decode = decode {
                print("response returned from remote")
            }
            response(decode)
        }
    }
    
    private func decodeJSON<T: Decodable>(type: T.Type, from: Data?) -> T? {
        let decoder = JSONDecoder()
        guard let data = from,
            let response = try? decoder.decode(type.self, from: data) else { return nil }
        
        return response
    }

}

