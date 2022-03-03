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
        NotificationCenter.default.addObserver(self, selector: #selector(reFetchData), name: NOTIF_ADD_FAVOURATE, object: nil)
    }
    
    func getAllLeagues(){
        CoreDataServices.instance.fetchData { result in
            switch result{
            case .success(let leagues):
                self.leaguesListViewModel.leaguesViewModel = (leagues?.leagues?.map(FavouratesVM.init))!
                
                self.tableView.reloadData()
            case .failure(let error):
                print("error is => \(error)")
                //activityIndicator.stopAnimating()
            }
        }
    }
    
    @objc func reFetchData(){
        getAllLeagues()
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
        cell.openVideo = {
            if vm.strYoutube != "" {
                let url = URL(string: "https://\(vm.strYoutube)")
                UIApplication.shared.open(url!)
                
            }else {
                print("no youtube link")
                //Toast.showToast(controller: self, message: "No link found", seconds: 1)
            }
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "LeguesDetailsVC")
        self.navigationController?.pushViewController(vc, animated: true)
        
//        let vm = self.leaguesListViewModel.leaguesViewModel(at: indexPath.row)
//        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "LeguesDetailsVC", creator: {
//                (coder) -> LeaguesDetailsVC? in
//
//            return LeaguesDetailsVC(coder: coder, leaguesViewModel: vm)
//        })
//        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "LeguesDetailsVC")
        self.navigationController?.pushViewController(vc, animated: true)
    
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let vm = self.leaguesListViewModel.leaguesViewModel(at: indexPath.row)
            print("Deleted")
            let alert = UIAlertController(title: "Delete", message: "remove from favourates", preferredStyle: .alert)
            let action = UIAlertAction(title: "Delete", style: .destructive) { _ in
                CoreDataServices.instance.deleteData(name: vm.name) { sucess in
                    if sucess{
                        self.getAllLeagues()
                    }else{
                        print("unable to delete")
                    }
                }
            }
            let cancel = UIAlertAction(title: "cancel", style: .default, handler: nil)
            alert.addAction(action)
            alert.addAction(cancel)
            self.present(alert, animated: true, completion: nil)
          }
    }

}
