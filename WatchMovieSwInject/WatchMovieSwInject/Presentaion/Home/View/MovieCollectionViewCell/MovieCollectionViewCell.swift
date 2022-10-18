//
//  MovieCollectionViewCell.swift
//  WatchMovieSwInject
//
//  Created by Khalil Mhelheli on 28/9/2022.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell, CellProtocol {
    
    var delegate: HomeCellDelegate?
    private var imageTask: URLSessionDataTask?
   
    
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        cardView.layer.cornerRadius = 8
        cardView.layer.borderWidth = 1
        cardView.layer.borderColor = UIColor.grey60.cgColor
        cardView.renderShadow()
    }
    
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        return CGSize(width: self.superview?.frame.width ?? containerView.frame.width,
                      height: 339)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        imageTask?.cancel()
    }
    
    
    func configure(with viewModel: CellViewModelProtocol) {
        guard let viewModel = viewModel as? MovieCollectionViewCellViewModel else { return }
        titleLabel.text = viewModel.title
        yearLabel.text = viewModel.year
        if let url = viewModel.artworkURL?.convertToImdbImage192x264Url() {
            setUpImage(with: url)
        } else {
            imageView.image = UIImage(named: "placeholder_image")
            imageView.contentMode = .scaleToFill
        }

    }
    
    func setUpImage(with link: URL) {
        imageTask = imageView.loadImage(from: link, completion: { [weak self] image in
            guard let image = image else { return }
            self?.delegate?.onFinishImageDownload(image: image, url: link)
        })
    }
}
