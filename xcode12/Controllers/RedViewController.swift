//
//  RedViewController.swift
//  xcode12
//
//  Created by Dima on 06.12.2020.
//

import UIKit

class RedViewController: UIViewController {

    @IBAction func redBtn(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
