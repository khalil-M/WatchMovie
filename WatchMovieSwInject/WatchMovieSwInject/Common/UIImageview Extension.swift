//
//  UIImageview Extension.swift
//  WatchMovieSwInject
//
//  Created by Khalil Mhelheli on 28/9/2022.
//

import Foundation
import UIKit
extension UIImageView {
    func loadImage(from url: URL, completion: @escaping (_ image: UIImage?) -> ()) -> URLSessionDataTask {
        let activityIndicator = UIActivityIndicatorView()
        if #available(iOS 13.0, *) {
            activityIndicator.style = .medium
        } else {
            activityIndicator.style = .gray
        }
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
        self.addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        let centerX = NSLayoutConstraint(item: self,
                                         attribute: .centerX,
                                         relatedBy: .equal,
                                         toItem: activityIndicator,
                                         attribute: .centerX,
                                         multiplier: 1,
                                         constant: 0)
        let centerY = NSLayoutConstraint(item: self,
                                         attribute: .centerY,
                                         relatedBy: .equal,
                                         toItem: activityIndicator,
                                         attribute: .centerY,
                                         multiplier: 1,
                                         constant: 0)
        self.addConstraints([centerX, centerY])
        return UIImage.loadFrom(url: url) { image in
            self.image = image
            self.contentMode = .scaleAspectFill
            activityIndicator.stopAnimating()
            completion(image)
        }
    }
}
