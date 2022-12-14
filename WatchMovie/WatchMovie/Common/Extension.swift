//
//  Extension.swift
//  WatchMovie
//
//  Created by Khalil Mhelheli on 30/9/2022.
//

import Foundation
import UIKit

extension UIView {
    var width: CGFloat {
        return frame.size.width
    }
    
    var height: CGFloat {
        return frame.size.height
    }
    
    var left: CGFloat {
        return frame.origin.x
    }
    
    var right: CGFloat {
        return left + width
    }
    
    var top: CGFloat {
        return frame.origin.y
    }
    
    var bottom: CGFloat {
        return top + height
    }
}

extension UIImageView {
    func downloadImage(fromURL url:URL) -> URLSessionDataTask {
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            
            guard let strongSelf = self else { return }
            
            guard let httpURLResponse = response as? HTTPURLResponse,
                  httpURLResponse.statusCode == 200,
                  let mimeType = response?.mimeType,
                  mimeType.hasPrefix("image"),
                  let data = data, error == nil,
                  let image = UIImage(data: data) else {
                return
            }
            
            DispatchQueue.main.async {
                strongSelf.image = image
                
                do {
                   try OnDiskImageCaching.publicCache.cacheImage(image, url: url)
                } catch {
                    print(error.localizedDescription)
                }
                
            }
        }
        task.resume()
        return task
    }
}

extension URL {
    /// this utility convertion method works  only for imdb images  urls
    func convertToImdbImageOriginalUrl() -> URL? {
        var path = "https://imdb-api.com/images/original/" + self.lastPathComponent
        guard let range = path.range(of: "._V1") else {
            return nil
        }
        path = path.substring(to: range.lowerBound)
        path.append("._V1_Ratio0.6791_AL_.jpg")
        
        return URL(string: path)
    }
    
    func convertToImdbImage192x264Url() -> URL? {
        var path = "https://imdb-api.com/images/192x264/" + self.lastPathComponent
        guard let range = path.range(of: "._V1") else {
            return nil
        }
        path = path.substring(to: range.lowerBound)
        path.append("._V1_Ratio0.6791_AL_.jpg")
        
        return URL(string: path)
    }
    
    func convertToImdbImage384x528Url() -> URL? {
        var path = "https://imdb-api.com/images/384x528/" + self.lastPathComponent
        guard let range = path.range(of: "._V1") else {
            return nil
        }
        path = path.substring(to: range.lowerBound)
        path.append("._V1_Ratio0.6791_AL_.jpg")
        
        return URL(string: path)
    }
}
