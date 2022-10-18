//
//  AppManagerProtocol.swift
//  WatchMovie
//
//  Created by Khalil Mhelheli on 23/9/2022.
//

import Foundation
import Swinject
import UIKit

protocol AppManagerProtocol {
    var service: AppServiceProtocol { get }
    var delegate: HomePageDelegate? { get set}
    func cellCount() -> Int
    func getMostPopularMovies(response data: @escaping ([CellViewModelProtocol]) -> ())
    func updateCells(with image: UIImage, url: URL)
    func itemAt(indexPath: IndexPath) -> CellViewModelProtocol
}

protocol HomePageDelegate: AnyObject {
    func onLoadingData()
    func didReceiveData()
}


class AppManager: AppManagerProtocol {
    
    var service: AppServiceProtocol
    private var cells: [CellViewModelProtocol] = []
    private var mostPopularMvies: [MostPopularDataDetail] = []
    weak var delegate: HomePageDelegate?
    
    

    required init(service: AppServiceProtocol) {
        self.service = service
    }
    
    func cellCount() -> Int {
        return cells.count
    }
    
    func itemAt(indexPath: IndexPath) -> CellViewModelProtocol {
        return cells[indexPath.row]
    }

    func getMostPopularMovies(response data: @escaping ([CellViewModelProtocol]) -> ())  {
        cells.append(LoadingIndicatorCellViewModel())
        service.getMostPopularMovies { response in
            guard let response = response else { return }
            let cellViewModels = response.items.map {
                MovieCollectionViewCellViewModel(title: $0.title, artworkURL: URL(string: $0.image), year: $0.year)
            }
            self.cells = cellViewModels
            self.mostPopularMvies = response.items
            self.delegate?.didReceiveData()
            data(cellViewModels)
        }
    }
    
    func updateCells(with image: UIImage, url: URL) {
        let url = url.convertToImdbImage384x528Url()
        guard let cellViewModels = cells as? [MovieCollectionViewCellViewModel] else { return }
        var updatedCellViewModels: [MovieCollectionViewCellViewModel] = []
        for cell in cellViewModels {
            if cell.artworkURL == url {
                let moviesCellViewModel = MovieCollectionViewCellViewModel(title: cell.title, artworkURL: cell.artworkURL, year: cell.year)
                updatedCellViewModels.append(moviesCellViewModel)
            } else {
                updatedCellViewModels.append(cell)
            }
        }
        self.cells = updatedCellViewModels
    }
    
}
