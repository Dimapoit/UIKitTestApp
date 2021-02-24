//
//  ModelUser.swift
//  xcode12
//
//  Created by Dima on 26.12.2020.
//

import Foundation
import UIKit

class ModelUser {
    
    /*var users = [User]()
    func setup() {
        users.append(User(name: "Petr", city: "Mariupol", image: UIImage(named: "man")!, gender: .male))
        users.append(User(name: "Alex", city: "Kyiv", image: UIImage(named: "man")!, gender: .male))
        users.append(User(name: "Dima", city: "Dnipro", image: UIImage(named: "man")!, gender: .male))
        users.append(User(name: "Lena", city: "Kharkiv", image: UIImage(named: "woman")!, gender: .female))
        users.append(User(name: "Alina", city: "Lviv", image: UIImage(named: "woman")!, gender: .female))
    }*/
    var users = [[User]]()
    
    func setup() {
    
        let manArray = [User(name: "Petr", city: "Mariupol", image: UIImage(named: "man")!, gender: .male),
                        User(name: "Alex", city: "Kyiv", image: UIImage(named: "man")!, gender: .male),
                        User(name: "Dima", city: "Dnipro", image: UIImage(named: "man")!, gender: .male)]
        
        let womanArray = [User(name: "Lena", city: "Kharkiv", image: UIImage(named: "woman")!, gender: .female),
                          User(name: "Alina", city: "Lviv", image: UIImage(named: "woman")!, gender: .female)]
        
        //users = [manArray, womanArray]
        
        users.append(manArray)
        users.append(womanArray)
    }
}
