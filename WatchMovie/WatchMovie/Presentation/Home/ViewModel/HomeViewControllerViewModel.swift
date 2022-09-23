//
//  HomeViewControllerViewModel.swift
//  WatchMovie
//
//  Created by Khalil Mhelheli on 23/9/2022.
//

import Foundation

class HomeViewControllerViewModel {
    
    ///vars
    private var manager: AppManagerProtocol

    
    private var mostPopularMovies: [MostPopularDataDetail] = []
    private var mostPopularTvs: [MostPopularDataDetail] = []
    
    var reloadCollectionView: () -> Void = { }
    
    init(manager: AppManagerProtocol) {
        self.manager = manager
    }
    
    public func getData() {
        manager.getMostPopularMovies { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    self?.mostPopularMovies = response.items
                    self?.reloadCollectionView()
                case .failure(let error):
                    print("Failed to fetch most popular movies: \(error)")
                }
            }
        }
    }
}
