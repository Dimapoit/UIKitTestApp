//
//  SettingsController.swift
//  xcode12
//
//  Created by Dima on 22.12.2020.
//

import UIKit

class SettingsController: UITableViewController {
    
    @IBAction func nameActionChange(_ sender: UITextField) {
        if let name = sender.text {
            UserDefaults.standard.setValue(name, forKey: "nameKey")
        }
        print(UserDefaults.standard.string(forKey: "nameKey")!)
    }
    
        
    
    @IBOutlet weak var nameField: UITextField!
    
    
    @IBOutlet weak var switchValue: UISwitch!
    
    @IBAction func swutchAction(_ sender: Any) {
        UserDefaults.standard.set(switchValue.isOn, forKey: "switchKey")
    }
    @IBOutlet weak var volValue: UISlider!
    
    
    @IBAction func volAction(_ sender: UISlider) {
        UserDefaults.standard.set(sender.value, forKey: "volumeKey")
    }
    
    func loadSettings() {
        if let name = UserDefaults.standard.string(forKey: "nameKey") {
            nameField.text = name
        }
        switchValue.isOn = UserDefaults.standard.bool(forKey: "switchKey")
        volValue.value = UserDefaults.standard.float(forKey: "volumeKey")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadSettings()
    }
}
