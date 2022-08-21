//
//  UIImageView+Caching.swift
//  flower-list
//
//  Created by v.chimpalee on 21/8/2565 BE.
//

import UIKit

let imageCache = NSCache<NSString, UIImage>()

extension UIImageView {

  func loadImageWithUrl(urlString: String) {

    image = nil

    if let cachedImage = imageCache.object(forKey: urlString as NSString) {
      image = cachedImage
      return
    }

    if let url = URL(string: urlString) {
      let session = URLSession.shared
      let dataTask = session.dataTask(with: url) { (data, response, error) in
        if error != nil {
          return
        }

        if let unwrappedData = data, let downloadedImage = UIImage(data: unwrappedData) {
          DispatchQueue.main.async(execute: {
            imageCache.setObject(downloadedImage, forKey: urlString as NSString)
            self.image = downloadedImage
          })
        }

      }
      dataTask.resume()
    }
  }
}
