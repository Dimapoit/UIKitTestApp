//
//  TableViewCell.swift
//  xcode12
//
//  Created by Dima on 26.12.2020.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var myImageView: UIImageView!
    
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
