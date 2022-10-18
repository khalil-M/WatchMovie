//
//  MovieCollectionViewCellViewModel.swift
//  WatchMovieSwInject
//
//  Created by Khalil Mhelheli on 28/9/2022.
//

import Foundation
import UIKit
struct MovieCollectionViewCellViewModel: CellViewModelProtocol {
    var cellType: CellType = .moviesCell
    let title: String
    let artworkURL: URL?
    let year: String
    var image: UIImage?
}
