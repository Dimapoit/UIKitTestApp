//
//  FullScreenCollectionViewCell.swift
//  xcode12
//
//  Created by Dima on 19.12.2020.
//

import UIKit

class FullScreenCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var scrolView: UIScrollView!
    
    @IBOutlet weak var photoView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        scrolView.delegate = self
        self.scrolView.minimumZoomScale = 1.0
        self.scrolView.maximumZoomScale = 2.0
    }
}

extension FullScreenCollectionViewCell: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return photoView
    }
    
    /*func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) {
        scrollView.zoomScale = 1.0
    }*/
}
