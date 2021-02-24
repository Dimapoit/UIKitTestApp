//
//  ProfileViewController.swift
//  xcode12
//
//  Created by Dima on 06.12.2020.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var photoGallery = PhotoGallery()
    let identifier = "PhotoCollectionViewCell"
    let imagePicker = UIImagePickerController()
    
    let cellsInRow = 3
    let ofset: CGFloat = 2.0
    var spacing: CGFloat {
        return CGFloat((cellsInRow + 1)) * ofset / CGFloat(cellsInRow)
    }
    @IBOutlet weak var labelName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: identifier, bundle: nil),
                                forCellWithReuseIdentifier: identifier)
        
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(tapOnImage))
        avatar.addGestureRecognizer(tapGR)
        avatar.isUserInteractionEnabled = true
        
        imagePicker.delegate = self

        avatar.layer.borderWidth = 3.0
        avatar.layer.borderColor = UIColor.lightGray.cgColor
        /*let imgWidth = avatar.image?.size.width
        print (imgWidth!
        let imgHeight = avatar.image?.size.height
        print (imgHeigh
        let imgViewWidth = avatar.bounds.size.width
        print (imgViewWidth)
        let imgViewHetght = avatar.bounds.size.height
        print (imgViewHetght)*/
        //imageView.bounds.size.width / imageView.image!.size.width
    }
    
    @objc func tapOnImage(_ sender: UITapGestureRecognizer) {
        let alert = UIAlertController(title: "Avatar", message: nil, preferredStyle: .actionSheet)
        
        let actionPhoto = UIAlertAction(title: "gallery", style: .default) {(alert) in
            self.imagePicker.sourceType = .photoLibrary
            self.imagePicker.allowsEditing = true
            self.present(self.imagePicker, animated: true, completion: nil)
        }
        
        let actionCamera = UIAlertAction(title: "Camera", style: .default) {(alert) in
            self.imagePicker.sourceType = .camera
            self.imagePicker.allowsEditing = true
            self.present(self.imagePicker, animated: true, completion: nil)
        }
        
        let actionCancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(actionPhoto)
        alert.addAction(actionCamera)
        alert.addAction(actionCancel)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let name = UserDefaults.standard.string(forKey: "nameKey") {
            super.viewWillAppear(animated)
            labelName.text = name
        }
    }
}

extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            avatar.image = pickedImage
            dismiss(animated: true, completion: nil)
        }
    }
    
}

extension ProfileViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoGallery.imades.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier,
                                                        for: indexPath) as! PhotoCollectionViewCell
        cell.photoView.image = photoGallery.imades[indexPath.item]
        
        return cell
    }
}

extension ProfileViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let frameCV = collectionView.frame
        let widthCell = frameCV.width / CGFloat(cellsInRow)
        let heightCell = widthCell
        
        
        return CGSize(width: widthCell - spacing, height: heightCell - (ofset * 2))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return spacing
    }
}

extension ProfileViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let VC = storyboard?.instantiateViewController(identifier: "FullScreenController") as! FullScreenController
        VC.photoGallery = self.photoGallery
        VC.indexPath = indexPath
        
        self.navigationController?.pushViewController(VC, animated: true)
    }
}


