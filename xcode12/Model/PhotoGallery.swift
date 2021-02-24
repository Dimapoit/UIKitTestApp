//
//  PhotoGallery.swift
//  xcode12
//
//  Created by Dima on 19.12.2020.
//

import Foundation
import UIKit

class PhotoGallery {
    
    init() {
        self.setup()
    }
    
    var imades = [UIImage]()
    
    func setup ()  {
        for i in 0...7 {
            let image = UIImage(named: "images-\(i)")!
            imades.append(image)
        }
    }
}
