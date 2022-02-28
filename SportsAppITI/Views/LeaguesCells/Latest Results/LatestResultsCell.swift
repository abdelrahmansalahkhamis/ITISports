//
//  LatestResultsCell.swift
//  SportsAppITI
//
//  Created by abdrahman on 26/02/2022.
//

import UIKit

class LatestResultsCell: UICollectionViewCell {
    
    static let identifier = "LatestResultsCell"
    @IBOutlet weak var tableView: UITableView!

    var ntdlArray = ["Play Video Games", "Eat out", "Watch Netflix", "Play Video Games", "Eat out", "Watch Netflix", "Play Video Games", "Eat out", "Watch Netflix", "Play Video Games", "Eat out", "Watch Netflix"]
    let ntdlCell = "ntdlCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "LatestResultTableViewCell", bundle: nil), forCellReuseIdentifier: LatestResultTableViewCell.identifier)
        
        self.tableView.rowHeight = 180
    }
}



extension LatestResultsCell: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ntdlArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LatestResultTableViewCell.identifier, for: indexPath) as! LatestResultTableViewCell
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! UITableViewCell
//        cell.textLabel?.text = ntdlArray[indexPath.item]
        
        //cell.configUI()
        return cell
    }

    
    
}
