//
//  NetworkingServiceError.swift
//  WatchMovie
//
//  Created by Khalil Mhelheli on 23/9/2022.
//

import Foundation
public enum NetworkingServiceError: Swift.Error {
    case connectivity
    case invalidData
    case badRequest
    case notAuthorized
}
