//
//  EmptyCellViewModel.swift
//  WatchMovieSwInject
//
//  Created by Khalil Mhelheli on 28/9/2022.
//

import Foundation

struct EmptyCellViewModel: CellViewModelProtocol {
    var cellType: CellType = .emptyCell
    var informationMessge: String
}
