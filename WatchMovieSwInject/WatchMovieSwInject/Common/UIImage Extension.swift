//
//  UIImage Extension.swift
//  WatchMovieSwInject
//
//  Created by Khalil Mhelheli on 28/9/2022.
//

import Foundation
import UIKit
extension UIImage {
    public static func loadFrom(url: URL, completion: @escaping (_ image: UIImage?) -> ()) -> URLSessionDataTask {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                DispatchQueue.main.async {
                    completion(UIImage(data: data))
                }
            } else {
                completion(nil)
            }
        }
        task.resume()
        return task
       
    }
}
