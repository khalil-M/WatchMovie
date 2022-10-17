//
//  MovieDetailsViewControllerViewModel.swift
//  WatchMovie
//
//  Created by Khalil Mhelheli on 17/10/2022.
//

import Foundation

class MovieDetailsViewControllerViewModel {
    
    ///vars
    private var manager: AppManagerProtocol
    weak var delegate: MovieDetailsDelegate?
    let movieId: String
    var movie: TitleData? = nil
    
    init(id: String, manager: AppManagerProtocol) {
        self.manager = manager
        self.movieId = id
    }
    
    func loadMovie() {
        
        manager.getTitle(for: movieId) { [weak self] result in
            guard let strongSelf = self else { return }
            switch result {
            case .success(let titleData):
                strongSelf.movie = titleData
                strongSelf.delegate?.reloadData()
                
            case .failure(let error):
                print("failed to fetch TitleDatga object: \(error)")
            }
            
        }
        
    }
    
    func getTitle() -> String {
        guard let movie = movie else { return "-"}
        return movie.title
    }
    
    func getDescription() -> String {
        guard let movie = movie else { return "-"}
        return movie.fullTitle
    }
    
    func getImageUrl() -> URL? {
        guard let movie = movie else { return nil }
        let url = URL(string: movie.image)
        
        return url?.convertToImdbImageOriginalUrl()
    }



}
