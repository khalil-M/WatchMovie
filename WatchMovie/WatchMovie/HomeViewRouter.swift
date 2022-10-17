//
//  HomeViewRouter.swift
//  WatchMovie
//
//  Created by Khalil Mhelheli on 17/10/2022.
//

import Foundation
import UIKit

class HomeViewRouter {
    var navigationController: UINavigationController?
    
    func rootToMoviesDetails(for movie: MostPopularDataDetail) {
        let vc = MoieDependencies.shared.makeMovieDetailsViewController(for: movie.id)
        navigationController?.pushViewController(vc, animated: true)
    }
}
