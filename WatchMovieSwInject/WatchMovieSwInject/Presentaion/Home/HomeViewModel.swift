//
//  HomeViewModel.swift
//  WatchMovieSwInject
//
//  Created by Khalil Mhelheli on 28/9/2022.
//

import Foundation

class HomeViewModel {
    
    var manager: AppManagerProtocol?
    
    func getMostPopularMovies() {
        manager?.getMostPopularMovies(response: { response in
            print(response)
        })
    }
}
