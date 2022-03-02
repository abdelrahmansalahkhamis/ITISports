//
//  FavouratesVC.swift
//  SportsAppITI
//
//  Created by abdrahman on 23/02/2022.
//

import UIKit

private let reuseIdentifier = "LeagueCell"

class FavouratesVC: UITableViewController {
    
    var leaguesListViewModel = FavouratesListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "LeagueCell", bundle: nil), forCellReuseIdentifier: reuseIdentifier)
        getAllLeagues()
    }
    
    func getAllLeagues(){
//        CoreDataServices.instance.fetchData { allLeagues in
//            guard allLeagues != nil else {
//                return
//            }
//            print(allLeagues)
//        }
        CoreDataServices.instance.fetchData { result in
            switch result{
            case .success(let leagues):
                self.leaguesListViewModel.leaguesViewModel = (leagues?.leagues?.map(FavouratesVM.init))!
                //self.leaguesListViewModel.leaguesViewModel = leagues.leagues.map(FavouratesVM.init)
                //self.leaguesListViewModel
                //self.leaguesListViewModel. = leagues.map( LeaguesCoreData.init)
                //self.collectionView.reloadData()
                self.tableView.reloadData()
                //activityIndicator.stopAnimating()
            case .failure(let error):
                print("error is => \(error)")
                //activityIndicator.stopAnimating()
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
        
        cell.leagueImg.sd_setImage(with: URL(string: vm.strBadge), placeholderImage: UIImage(systemName: "gear"))
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
