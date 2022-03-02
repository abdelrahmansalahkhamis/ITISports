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
    
    var latestResultsViewModel: LatestResultsListVM?
    //let leagesDetails = LeaguesDetailsVC()
    
//    init?(coder: NSCoder, latestResultsViewModel: LatestResultsVM) {
//        self.latestResultsViewModel
//        super.init(coder: coder)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }

    override func awakeFromNib() {
        super.awakeFromNib()
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "LatestResultTableViewCell", bundle: nil), forCellReuseIdentifier: LatestResultTableViewCell.identifier)
        
        self.tableView.rowHeight = 180
        
    }
    
    func configTableData(vm: LatestResultsListVM){
        self.latestResultsViewModel = vm
        tableView.reloadData()
    }
    
}



extension LatestResultsCell: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard latestResultsViewModel != nil else {
            return 1
        }
        return latestResultsViewModel!.latestResultsVM.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LatestResultTableViewCell.identifier, for: indexPath) as! LatestResultTableViewCell
        guard let vm = latestResultsViewModel?.latestResultsViewModel(at: indexPath.row) else{
            return UITableViewCell()
        }
        
        cell.configUI(vm: vm)
        return cell
    }
    
}
