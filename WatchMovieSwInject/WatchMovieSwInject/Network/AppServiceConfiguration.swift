//
//  AppServiceConfiguration.swift
//  WatchMovieSwInject
//
//  Created by Khalil Mhelheli on 28/9/2022.
//

import Foundation


enum AppServiceConfiguration {
    case mostPopularMovies
    case mostPopularTvs
}

extension AppServiceConfiguration: Endpoint {
    var path: String {
        switch self {
        case .mostPopularMovies:
            return "https://imdb-api.com/en/API/MostPopularMovies/k_4olf5ls3"
        case .mostPopularTvs:
            return "https://imdb-api.com/en/API/MostPopularTVs/k_4olf5ls3"
        }
    }
}

