//
//  LeguesVC.swift
//  SportsAppITI
//
//  Created by abdrahman on 24/02/2022.
//

import UIKit

private let reuseIdentifier = "LeagueCell"

class LeguesVC: UITableViewController {
    
    var leaguesListViewModel = LeaguesListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "LeagueCell", bundle: nil), forCellReuseIdentifier: reuseIdentifier)
        getAllLeagues()
    }
    
    func getAllLeagues(){
        WebService.load(resource: Countrys.getAllLeagues("Motorsport")) { result in
            switch result{
            case .success(let leagues):
                self.leaguesListViewModel.leaguesViewModel = leagues.countrys.map(LeguesVM.init)
                self.tableView.reloadData()
            case .failure(let error):
                print("error is => \(error)")
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return leaguesListViewModel.leaguesViewModel.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let vm = self.leaguesListViewModel.leaguesViewModel(at: indexPath.row)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? LeagueCell else{
            return UITableViewCell()
        }
                
        //cell.sportImg.image = UIImage(systemName: "gear")
        cell.leagueImg.sd_setImage(with: URL(string: vm.strLeagueBadge), placeholderImage: UIImage(systemName: "gear"))
        cell.leagueLbl.text = vm.name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
