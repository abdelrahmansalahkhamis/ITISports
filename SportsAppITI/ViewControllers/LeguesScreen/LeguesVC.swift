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
    var leaguesForSport: String
  
    
//    init(leaguesForSport: String) {
//        self.leaguesForSport = leaguesForSport
//        super.init(style: UITableView.Style.plain)
//
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//       super.init(coder: aDecoder)
//    }
    init?(coder: NSCoder, sport: String) {
        self.leaguesForSport = sport
        super.init(coder: coder)
    }
 
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "LeagueCell", bundle: nil), forCellReuseIdentifier: reuseIdentifier)
        print("leaguesForSport is :- \(leaguesForSport)")
        getAllLeagues()
    }
    
    func getAllLeagues(){
        WebService.load(resource: Countrys.getAllLeagues(leaguesForSport)) { result in
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

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "LeguesDetailsVC", creator: {
//                (coder) -> LeaguesDetailsVC? in
//            return LeaguesDetailsVC()
//            })
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "LeguesDetailsVC")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}