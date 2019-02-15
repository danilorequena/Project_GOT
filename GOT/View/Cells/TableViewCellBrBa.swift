//
//  TableViewCellBrBa.swift
//  GOT
//
//  Created by Danilo Requena on 15/02/19.
//  Copyright © 2019 Danilo Requena. All rights reserved.
//

import UIKit

class TableViewCellBrBa: UITableViewCell {

    @IBOutlet weak var imageBrBa: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelSubTitle: UILabel!
    
    
    func commonInit(_ imageName: String, title: String, sub: String) {
        imageBrBa.image = UIImage(named: imageName)
        labelTitle.text = title
        labelSubTitle.text = sub
    }
}
