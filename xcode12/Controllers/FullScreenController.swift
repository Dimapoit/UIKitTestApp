//
//  FullScreenController.swift
//  xcode12
//
//  Created by Dima on 19.12.2020.
//

import UIKit

private let reuseIdentifier = "Cell"

class FullScreenController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var photoGallery: PhotoGallery!
    var indexPath: IndexPath!
    let identifier = "FullScreenCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self

        // Register cell classes
        collectionView.register(UINib(nibName: "FullScreenCollectionViewCell", bundle: nil),
                                forCellWithReuseIdentifier: identifier)
        collectionView.performBatchUpdates(nil) {(result) in
            self.collectionView.scrollToItem(at: self.indexPath, at: .centeredHorizontally, animated: false)
        }
    }
}
extension FullScreenController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoGallery.imades.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! FullScreenCollectionViewCell
        cell.photoView.image = photoGallery.imades[indexPath.item]
        return cell
    }
}

extension FullScreenController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let frameCV = collectionView.frame
        
        return CGSize(width: frameCV.width, height: frameCV.width)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
