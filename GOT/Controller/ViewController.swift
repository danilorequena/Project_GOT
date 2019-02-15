//
//  ViewController.swift
//  GOT
//
//  Created by Danilo Requena on 15/02/19.
//  Copyright © 2019 Danilo Requena. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    let houseData = [
        ["Arryn", "Baratheon"],
        ["Greyjoy", "Lannister", "Martell","Stark"],
        ["Targaryen", "Tully", "Tyrell"]
    ]
    
    let wordsData = [
        ["As high as honor", "Ours is the fury"],
        ["We do not sow", "Hear me roar", "Unbowed, unbent, unbroken","Winter is coming"],
        ["fire and blood", "Family, duty, honor", "Growing strong"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "GOT"
        tableView.delegate = self
        tableView.dataSource = self
        configCell()
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var row: Int!
        switch section {
        case 0:
            row = 2
            break
        case 1:
            row = 4
            break
        case 2:
            row = 3
            break
        default:
            break
        }
        
        return row
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var headerLabel: String!
        switch section {
        case 0:
            headerLabel = "Header 1"
            break
        case 1:
            headerLabel = "Header 2"
            break
        case 2:
            headerLabel = "Header 3"
            break
        default:
            break
        }
        return headerLabel
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.commonInit("got_\(indexPath.section)_\(indexPath.item)", title: houseData[indexPath.section][indexPath.item], sub:  wordsData[indexPath.section][indexPath.item])
        print("danilo", houseData[indexPath.section][indexPath.item])
        print("got_\(indexPath.section)_\(indexPath.item)")
        print("danilo1", "got_bg_\(indexPath.section)_\(indexPath.item)")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 86
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let details = DetailViewController()
        details.commonInit("got_bg_\(indexPath.section)_\(indexPath.item)", title: houseData[indexPath.section][indexPath.item])
        self.navigationController?.pushViewController(details, animated: true)
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func configCell() {
        let nibName = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "cell")
    }


}

