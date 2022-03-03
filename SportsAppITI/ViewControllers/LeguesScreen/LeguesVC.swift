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
    
    var filteredLeaguesListViewModel = LeaguesListViewModel()
    var leaguesForSport: String
    
    private let searchController = UISearchController(searchResultsController: nil)

    private var inSearchMode: Bool{
            return searchController.isActive && !searchController.searchBar.text!.isEmpty
        }
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
        configureSearchController()
        getAllLeagues()
    }
    
    func getAllLeagues(){
        WebService.load(resource: LeagueModel.getAllLeagues(leaguesForSport)) { result in
            switch result{
            case .success(let leagues):
                self.leaguesListViewModel.leaguesViewModel = leagues.countrys.map(LeguesVM.init)
                self.tableView.reloadData()
            case .failure(let error):
                print("error is => \(error)")
            }
        }
    }

    func configureSearchController(){
            searchController.searchResultsUpdater = self
            searchController.searchBar.showsCancelButton = false
            navigationItem.searchController = searchController
            searchController.obscuresBackgroundDuringPresentation = false
            searchController.hidesNavigationBarDuringPresentation = false
            searchController.searchBar.placeholder = "search"
            definesPresentationContext = false
            if let textField = searchController.searchBar.value(forKey: "searchField") as? UITextField{
                textField.backgroundColor = .white
                textField.textAlignment = .center
                textField.placeholder = "search"
            }
        }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return inSearchMode ? filteredLeaguesListViewModel.leaguesViewModel.count : leaguesListViewModel.leaguesViewModel.count
        //return leaguesListViewModel.leaguesViewModel.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var vm: LeguesVM
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? LeagueCell else{
            return UITableViewCell()
        }
        if inSearchMode{
            vm = self.filteredLeaguesListViewModel.leaguesViewModel(at: indexPath.row)
        }else{
            vm = self.leaguesListViewModel.leaguesViewModel(at: indexPath.row)
        }
        cell.leagueImg.sd_setImage(with: URL(string: vm.strLeagueBadge), placeholderImage: UIImage(systemName: "gear"))
        cell.leagueLbl.text = vm.name
        cell.openVideo = {
            if vm.strLeagueYoutube != "" {
                let url = URL(string: "https://\(vm.strLeagueYoutube)")
                UIApplication.shared.open(url!)
                
            }else {
                print("no youtube link")
            }
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var vm: LeguesVM
        if inSearchMode{
            vm = self.filteredLeaguesListViewModel.leaguesViewModel(at: indexPath.row)
        }else{
            vm = self.leaguesListViewModel.leaguesViewModel(at: indexPath.row)
        }
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "LeguesDetailsVC", creator: {
                (coder) -> LeaguesDetailsVC? in
            return LeaguesDetailsVC(coder: coder, leaguesViewModel: vm)
            })
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension LeguesVC: UISearchResultsUpdating{
    // called everytime you type something
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text?.lowercased() else {return}
        
        filteredLeaguesListViewModel.leaguesViewModel = leaguesListViewModel.leaguesViewModel.filter({ (item) -> Bool in
            return item.name.contains(searchText)
            //return String(item).contains(searchText)
        })
        self.tableView.reloadData()
    }
}
