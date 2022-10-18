//
//  ViewController.swift
//  WatchMovieSwInject
//
//  Created by Khalil Mhelheli on 27/9/2022.
//

import UIKit
import Swinject
class HomeViewController: UIViewController {
    
    
    var manager: AppManagerProtocol!
    
    private var mostPopularMovies: [MostPopularDataDetail] = []
    
    var viewModel: HomeViewModel!
    
    private let refreshControl = UIRefreshControl()
    
    convenience init(viewModel: HomeViewModel) {
        self.init()
        self.viewModel = viewModel
    }
    
    @IBOutlet var collectionView: UICollectionView! {
        didSet {
            CellType.allCases.forEach {
                collectionView.register(UINib(nibName: $0.nibName, bundle: nil), forCellWithReuseIdentifier: $0.identifier)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        manager.delegate = self
        collectionView.alwaysBounceVertical = true
        refreshControl.tintColor = .lightGray
        refreshControl.addTarget(self, action: #selector(handleRefresh(refreshControl:)), for: .valueChanged)
        navigationItem.title = "Movies"
        collectionView.refreshControl = refreshControl
        manager?.getMostPopularMovies(response: { response in
            print(response)
        })
    }
    
    @objc func handleRefresh(refreshControl: UIRefreshControl) {
        manager?.getMostPopularMovies(response: {  response in
           
        })

    }

}

// MARK: Collection View Delegate & Data Source methods
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return manager.cellCount()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellViewModel = manager?.itemAt(indexPath: indexPath)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: (cellViewModel?.cellType.identifier)! , for: indexPath)
        if var cell = cell as? CellProtocol {
            cell.delegate = self
            cell.configure(with: cellViewModel!)
        }
        return cell
    }
    

}
extension HomeViewController: HomePageDelegate {
    func onLoadingData() {
        DispatchQueue.main.async { [weak self] in
            self?.collectionView.layoutIfNeeded()
            self?.collectionView.reloadData()
        }
    }
    
    func didReceiveData() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}

extension HomeViewController: HomeCellDelegate {
    func onFinishImageDownload(image: UIImage, url: URL) {
        manager?.updateCells(with: image, url: url)
    }
}


