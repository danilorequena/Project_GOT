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
    
    let brbaData = [
        ["Heisenberg", "Jesse Pinkman"]
    ]
    let brbaWords = [
        ["Walter White", "Drogado de Merda"]
    ]
    
    var seriesData = [[[""]]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Series"
        configSeriesData()
        
        configCell()
        
        
    }
    
    func configSeriesData() {
        seriesData.append(houseData)
        seriesData.append(wordsData)
        seriesData.append(brbaData)
        seriesData.append(brbaWords)
        
        tableView.delegate = self
        tableView.dataSource = self
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
        case 3:
            row = 2
        default:
            break
        }
        
        return row
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 3:
            return 80
        default:
            return 15
        }
        
        
        
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        let headerView = view as! UITableViewHeaderFooterView
        
        switch section {
        case 3:
            if let label = headerView.textLabel {
                label.font = UIFont(name: "Helvetica", size: 30)
            }
        default:
            break
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var headerLabel: String!
        switch section {
        case 0:
            headerLabel = "Casas 1"
            break
        case 1:
            headerLabel = "Casas 2"
            break
        case 2:
            headerLabel = "Casas 3"
            break
        case 3:
            headerLabel = "Breaking Bad"
            
        default:
            break
        }
        return headerLabel
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            let cellGot = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
            
//            cellGot.commonInit("got_\(indexPath.section)_\(indexPath.item)", title: houseData[indexPath.section][indexPath.item], sub:  wordsData[indexPath.section][indexPath.item])
            
            cellGot.commonInit("got_\(indexPath.section)_\(indexPath.item)", title: houseData[0][indexPath.item], sub: wordsData[0][indexPath.item])
            return cellGot
            
        case 1:
            let cellGot = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell

            cellGot.commonInit("got_\(indexPath.section)_\(indexPath.item)", title: houseData[1][indexPath.item], sub:  wordsData[1][indexPath.item])

            return cellGot

        case 2:
            let cellGot = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell

                cellGot.commonInit("got_\(indexPath.section)_\(indexPath.item)", title: houseData[2][indexPath.item], sub:  wordsData[2][indexPath.item])

            return cellGot
        case 3:
            let cellBrBa = tableView.dequeueReusableCell(withIdentifier: "cellbrba", for: indexPath) as! TableViewCellBrBa

            print("Danilo","brba_\(indexPath.section)_\(indexPath.item)")
            
            
                cellBrBa.commonInit("brba_\(indexPath.section)_\(indexPath.item)", title: brbaData[0][indexPath.item], sub: brbaWords[0][indexPath.item])

            return cellBrBa
        
        default:
            break
        }
        
        
        
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 86
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        switch indexPath.section {
        case 3:
            print("danilo","brba_bg_\(indexPath.section)_\(indexPath.item)")
            
            let detailsBrBa = DetailViewController()
                detailsBrBa.commonInit("brba_bg_\(indexPath.section)_\(indexPath.item)", title: brbaData[0][indexPath.item])
                self.navigationController?.pushViewController(detailsBrBa, animated: true)
                self.tableView.deselectRow(at: indexPath, animated: true)
        
            
        default:
            let detailsGot = DetailViewController()
                detailsGot.commonInit("got_bg_\(indexPath.section)_\(indexPath.item)", title: houseData[indexPath.section][indexPath.item])
                self.navigationController?.pushViewController(detailsGot, animated: true)
                self.tableView.deselectRow(at: indexPath, animated: true)
        }
        
        

        
    }
    
    func configCell() {
        let nibNameGot = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.register(nibNameGot, forCellReuseIdentifier: "cell")
        
        let nibNameBraBa = UINib(nibName: "TableViewCellBrBa", bundle: nil)
        tableView.register(nibNameBraBa, forCellReuseIdentifier: "cellbrba")
    }
    
    


}

