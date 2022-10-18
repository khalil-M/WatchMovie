//
//  LoadingIndicatorCell.swift
//  WatchMovieSwInject
//
//  Created by Khalil Mhelheli on 28/9/2022.
//

import UIKit

class LoadingIndicatorCell: UICollectionViewCell, CellProtocol {
    var delegate: HomeCellDelegate?
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!

    override func awakeFromNib() {
        super.awakeFromNib()
        loadingIndicator.startAnimating()
    }
    
  
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        return CGSize(width: self.superview?.frame.width ?? containerView.frame.width, height: self.superview?.frame.height ?? containerView.frame.height)
    }
    
    deinit {
        loadingIndicator.stopAnimating()
    }
    
    func configure(with viewModel: CellViewModelProtocol) { }
    
    
}
