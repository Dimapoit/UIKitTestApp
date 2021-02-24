//
//  FriendsController.swift
//  xcode12
//
//  Created by Dima on 22.12.2020.
//

import UIKit

class FriendsController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    let cellID = "cellID"
    
    var modelUser = ModelUser()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        // Зополняем модель данными
        modelUser.setup()
    }
}

extension FriendsController: UITableViewDataSource{
    
    /*func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section\(section)"
    }*/
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelUser.users[section].count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return modelUser.users.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Mans"
        } else {
            return "Womans"
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        /*var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellID)
        }
        cell?.textLabel!.text = "test"
        cell?.imageView!.image = UIImage(named: "images-0")!*/
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID) as! TableViewCell
        cell.label.text = modelUser.users[indexPath.section][indexPath.row].name
        cell.myImageView.image = modelUser.users[indexPath.section][indexPath.row].image
        
        return cell
    }
}

extension FriendsController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let section = modelUser.users[indexPath.section]
        //let user = modelUser.users[indexPath.section][indexPath.row]
        let user = section[indexPath.row]
        
        // Создаем Аллерт контроллер
        
        let allert = UIAlertController(title: user.name, message: user.city, preferredStyle: .alert)
        
        let profileAction = UIAlertAction(title: "Profile", style: .default) {(alert) in
            self.performSegue(withIdentifier: "goToProfile", sender: indexPath)
            
        }
        
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive) {(alert) in
            self.modelUser.users[indexPath.section].remove(at: indexPath.row)
            tableView.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        allert.addAction(profileAction)
        allert.addAction(deleteAction)
        allert.addAction(cancelAction)
        self.present(allert, animated: true, completion: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToProfile" {
            let vc = segue.destination as! UserController
            let indexPath = sender as! IndexPath
            let user = modelUser.users[indexPath.section][indexPath.row]
            vc.user = user
        }
    }
    
}
