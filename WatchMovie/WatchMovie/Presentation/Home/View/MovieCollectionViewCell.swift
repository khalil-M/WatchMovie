//
//  MovieCollectionViewCell.swift
//  WatchMovie
//
//  Created by Khalil Mhelheli on 30/9/2022.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "MovieCollectionViewCell"
    var task: URLSessionDataTask?
    
    private let label: UILabel = {
        let label = UILabel()
        label.backgroundColor = .gray
        label.textColor = .white
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.numberOfLines = 0
        return label
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "photo")
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        
        contentView.addSubview(imageView)
        contentView.addSubview(label)
        contentView.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = CGRect(x: 0, y: 0, width: width, height: height-44)
        label.frame = CGRect(x: 10, y: height-44, width: width-20, height: 44)
        label.sizeToFit()
    }
    
    
    
    
}
