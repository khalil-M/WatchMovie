//
//  EmptyViewCell.swift
//  WatchMovieSwInject
//
//  Created by Khalil Mhelheli on 28/9/2022.
//

import UIKit

class EmptyViewCell: UICollectionViewCell, CellProtocol {
    var delegate: HomeCellDelegate?
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var informationLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with viewModel: CellViewModelProtocol) {
        guard let viewModel = viewModel as? EmptyCellViewModel else { return }
        informationLabel.text = viewModel.informationMessge
    }
        

}
