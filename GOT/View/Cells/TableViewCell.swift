//
//  TableViewCell.swift
//  GOT
//
//  Created by Danilo Requena on 15/02/19.
//  Copyright © 2019 Danilo Requena. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var labelTitleCell: UILabel!
    @IBOutlet weak var labelSubTitleCell: UILabel!
    
    
    func commonInit(_ imageName: String, title: String, sub: String) {
        imageCell.image = UIImage(named: imageName)
        labelTitleCell.text = title
        labelSubTitleCell.text = sub
    }
    
   
    
}
