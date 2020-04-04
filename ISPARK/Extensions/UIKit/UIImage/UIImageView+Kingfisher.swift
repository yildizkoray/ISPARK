//
//  UIImageView+Kingfisher.swift
//  ISPARK
//
//  Created by Yildiz, Koray(AWF) on 4.04.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import UIKit
import Kingfisher

public extension UIImageView {
    
    private var cache: ImageCache {
        return ImageCache.default
    }
    
    func kf_setImage(with url: URL){
        
        let resource = ImageResource(downloadURL: url)
        
        if cache.isCached(forKey: resource.cacheKey) {
            cache.retrieveImage(forKey: resource.cacheKey) { [unowned self] result in
                
                switch result {
                case .success(let value):
                    self.image = value.image
                    
                case.failure(let error):
                    print("Failed getting image from cache:\(error.localizedDescription)")
                }
            }
        }
        else {
            self.kf.setImage(with: url, options: [.transition(.fade(0.2))])
        }
    }
}
