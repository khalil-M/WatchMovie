//
//  AbstracCell.swift
//  WatchMovieSwInject
//
//  Created by Khalil Mhelheli on 28/9/2022.
//

import Foundation
import UIKit

protocol CellViewModelProtocol {
    var cellType: CellType { get }
}

protocol HomeCellDelegate: AnyObject {
    func onFinishImageDownload(image: UIImage, url: URL)
}

protocol CellProtocol {
    var delegate: HomeCellDelegate? { set get }
    func configure(with viewModel: CellViewModelProtocol)
}

enum CellType: String, CaseIterable {
    case moviesCell = "MovieCollectionViewCell"
    case emptyCell = "emptyCell"
    case loading = "LoadingIndicatorCell"
    
    var nibName: String {
        switch self {
        case .moviesCell:
            return "MovieCollectionViewCell"
        case .emptyCell:
            return "emptyCell"
        case .loading:
            return "LoadingIndicatorCell"
        }
    }
    var identifier: String {
        return self.rawValue
    }
}
