//
//  TableViewCell.swift
//  TableViewActions
//
//  Created by Jaroslaw Szymczyk on 6/10/18.
//  Copyright © 2018 Jaroslaw Szymczyk. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
