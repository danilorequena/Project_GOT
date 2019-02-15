//
//  DetailViewController.swift
//  GOT
//
//  Created by Danilo Requena on 15/02/19.
//  Copyright © 2019 Danilo Requena. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imageDatail: UIImageView!
    @IBOutlet weak var labelDetail: UILabel!
    
    var imageName: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configImage()

        
    }

    func commonInit(_ imageName: String, title: String) {
        self.imageName = imageName
        self.title = title
    }
    
    func configImage() {
        imageDatail.image = UIImage(named: self.imageName)
    }
    

  

}
