//
//  UserController.swift
//  xcode12
//
//  Created by Dima on 29.12.2020.
//

import UIKit

class UserController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = user.image
        nameLabel.text = user.name
        cityLabel.text = user.city
    }
    
}
