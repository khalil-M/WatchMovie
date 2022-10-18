//
//  Extension.swift
//  WatchMovieSwInject
//
//  Created by Khalil Mhelheli on 28/9/2022.
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
    
    func renderShadow(scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowOffset = .zero
        layer.shadowRadius = 5
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
}

extension UIImage {
    
    //NOTE: This is not thread safe, please run it on a background thread.
    convenience init?(fromFile filePath:String) {
        guard let url = URL(string: filePath) else {
            return nil
        }
        
        self.init(fromURL: url)
    }
    
    //NOTE: This is not thread safe, please run it on a background thread.
    convenience init?(fromURL url:URL) {
        let imageData: Data
        
        do {
            imageData = try Data(contentsOf: url)
        } catch {
            return nil
        }
        
        self.init(data: imageData)
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
            
//            DispatchQueue.main.async {
//                strongSelf.image = image
//                
//                do {
//                   try OnDiskImageCaching.publicCache.cacheImage(image, url: url)
//                } catch {
//                    print(error.localizedDescription)
//                }
//                
//            }
        }
        task.resume()
        return task
    }
}

extension UIColor {
    convenience init(hexString: String) {
        var characterSet = CharacterSet.whitespacesAndNewlines
        characterSet.formUnion(CharacterSet(charactersIn: "#"))
        let cString = hexString.trimmingCharacters(in: characterSet).uppercased()
        if cString.count != 6 {
            self.init(white: 0.0, alpha: 0.0)
        } else {
            var rgbValue: UInt32 = 0
            Scanner(string: cString).scanHexInt32(&rgbValue)

            self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                      green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                      blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                      alpha: CGFloat(1.0))
        }
    }
    
    
    static var grey60: UIColor {
        return UIColor(hexString: "D3D3D3")
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
