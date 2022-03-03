//
//  LeaguesDetailsVC.swift
//  SportsAppITI
//
//  Created by abdrahman on 26/02/2022.
//

import UIKit
// https://lickability.com/blog/getting-started-with-uicollectionviewcompositionallayout/

protocol ConfigTableViewCellData: class{
    func configData(with vm: LatestResultsListVM)
}

class LeaguesDetailsVC: UIViewController {
    
    var upcommingEventsListViewModel = UpcomingEventListViewModel()
    var latestResultsListViewModel = LatestResultsListVM()
    var teamsListViewModel = TeamsListVM()
    
    weak var delegate: ConfigTableViewCellData?
    
    
    var eventsForLeagues: String
    var teamsForLeagues: String
    
    var leaguesViewModel: LeguesVM
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var favBtn: UIBarButtonItem!
    
    init?(coder: NSCoder, leaguesViewModel: LeguesVM) {
        self.leaguesViewModel = leaguesViewModel
        let leagueName = leaguesViewModel.leagueItem.strLeague.replacingOccurrences(of: " ", with: "%20")
        self.eventsForLeagues = leaguesViewModel.leagueItem.idLeague
        self.teamsForLeagues = leagueName
        super.init(coder: coder)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        collectionView.register(UINib(nibName: "HeaderView", bundle: nil), forSupplementaryViewOfKind: "header", withReuseIdentifier: "HeaderView")
        collectionView.register(UINib(nibName: "UpcomingEventsCell", bundle: nil), forCellWithReuseIdentifier: UpcomingEventsCell.identifier)
        collectionView.register(UINib(nibName: "LatestResultsCell", bundle: nil), forCellWithReuseIdentifier: LatestResultsCell.identifier)
        collectionView.register(UINib(nibName: "TeamsCell", bundle: nil), forCellWithReuseIdentifier: TeamsCell.identifier)
        collectionView.collectionViewLayout = createComposionalLayout()
        getAllUpcomingEvents()
        getLatestResults()
        getAllTeams()
    }
    
    @IBAction func favBtnPressed(_ sender: Any) {
        if favBtn.image == UIImage(systemName: "star"){

            CoreDataServices.instance.saveData(LeaguesCoreData(idLeague: leaguesViewModel.leagueItem.idLeague, strLeague: leaguesViewModel.leagueItem.strLeague, strBadge: leaguesViewModel.leagueItem.idLeague, strYoutube: leaguesViewModel.leagueItem.strYoutube)) { sucess in
                if sucess{
                    print("added to favourate sucessfully")
                    NotificationCenter.default.post(name: NOTIF_ADD_FAVOURATE, object: nil)
                    self.favBtn.image = UIImage(systemName: "star.fill")
                }else{
                    print("unable to add to favourate")
                }
            }
            
        }else{
            let alert = UIAlertController(title: "Attention", message: "remove from favourates?", preferredStyle: .alert)

            let action = UIAlertAction(title: "remove", style: .destructive) { _ in
                self.favBtn.image = UIImage(systemName: "star")
            }
            let cancel = UIAlertAction(title: "cancel", style: .default, handler: nil)
            alert.addAction(action)
            alert.addAction(cancel)
            self.present(alert, animated: true, completion: nil)
            
        }
    }
    func getAllUpcomingEvents(){
        WebService.load(resource: Event.getAllEvents(for: eventsForLeagues)) { result in
            switch result{
            case .success(let events):
                print("-------------")
                print(events)
                print("-------------")
                self.upcommingEventsListViewModel.upcomingEventsVM = events.events.map(UpcomingEventVM.init)
                //self.upcommingEventsListViewModel.upcomingEventsVM = events.events.map(UpcomingEventVM.init)
                self.collectionView.reloadData()
            case .failure(let error):
                print("error is => \(error)")
            }
        }
    }
    
    func getLatestResults(){
        WebService.load(resource: Event.getAllEvents(for: eventsForLeagues)) { result in
            switch result{
            case .success(let events):
                print("-------------")
                self.latestResultsListViewModel.latestResultsVM = events.events.map(LatestResultsVM.init)
                self.collectionView.reloadData()
            case .failure(let error):
                print("error is => \(error)")
            }
        }
    }
    
    func getAllTeams(){
        WebService.load(resource: Team.getAllTeams(for: teamsForLeagues)) { result in
            switch result{
            case .success(let teams):
                self.teamsListViewModel.teamsVM = teams.teams.map(TeamVM.init)
                self.collectionView.reloadData()
            case .failure(let error):
                print("error is => \(error)")
            }
            print("")
        }
    }
    
    func createComposionalLayout() -> UICollectionViewCompositionalLayout{
        let layout = UICollectionViewCompositionalLayout{ [weak self] (index, environment) -> NSCollectionLayoutSection? in
            return self?.createSectionFor(index: index, environment: environment)
        }
        return layout
    }
    
    func createSectionFor(index: Int, environment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection{
        switch index {
        case 0:
            return createFirstSection()
        case 1:
            
            return createSecondSection()
        case 2:
            return createThirdSection()
        default:
            return createFirstSection()
        }
    }
    func createFirstSection() -> NSCollectionLayoutSection{
        let inset: CGFloat = 3.5
        
        // item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.8), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: inset, leading: inset, bottom: inset, trailing: inset)
        
        // group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.2), heightDimension: .fractionalHeight(0.3))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
        
        // section
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        
        // supplementary
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(44))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: "header", alignment: .top)
        section.boundarySupplementaryItems = [header]
        return section
    }
    
    
    func createSecondSection() -> NSCollectionLayoutSection{
        let inset: CGFloat = 2.5
        
        // item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: inset, leading: inset, bottom: inset, trailing: inset)
        
        // group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.3))
//        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        // section
        let section = NSCollectionLayoutSection(group: group)
        let configuration = UICollectionViewCompositionalLayoutConfiguration()
        configuration.scrollDirection = .vertical
        
        // supplementary
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(44))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: "header", alignment: .top)
        section.boundarySupplementaryItems = [header]
        
        return section
    }
    
    func createThirdSection() -> NSCollectionLayoutSection{
        let inset: CGFloat = 3.5
        
        // item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.8), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: inset, leading: inset, bottom: inset, trailing: inset)
        
        // group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.2), heightDimension: .fractionalHeight(0.3))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
        
        // section
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        
        // supplementary
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(44))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: "header", alignment: .top)
        section.boundarySupplementaryItems = [header]
        return section
    }
}

extension LeaguesDetailsVC: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 2{
            let vm = teamsListViewModel.teamViewModel(at: indexPath.row)
            guard let teamDetailsVC = storyboard?.instantiateViewController(withIdentifier: "TeamDetailsVC") as? TeamDetailsVC else{
                return
            }
            teamDetailsVC.teamViewModel = vm
            self.navigationController?.pushViewController(teamDetailsVC, animated: true)
        }
        
    }
}
extension LeaguesDetailsVC: UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section{
        case 0:
            return upcommingEventsListViewModel.upcomingEventsVM.count
        case 1:
            return 1
        case 2:
            return teamsListViewModel.teamsVM.count
        default:
            return 2
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let vm = self.upcommingEventsListViewModel.upcomingEventsViewModel(at: indexPath.row)
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UpcomingEventsCell.identifier, for: indexPath) as! UpcomingEventsCell
            cell.configUI(vm: vm)
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LatestResultsCell.identifier, for: indexPath) as! LatestResultsCell
            let vm = self.latestResultsListViewModel
            cell.configTableData(vm: vm)
            return cell
        case 2:
            let vm = self.teamsListViewModel.teamViewModel(at: indexPath.row)
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TeamsCell.identifier, for: indexPath) as! TeamsCell
            cell.configUI(vm: vm)
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
            cell.backgroundColor = UIColor(hue: drand48(), saturation: 1, brightness: 1, alpha: 1)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let view = collectionView.dequeueReusableSupplementaryView(ofKind: "header", withReuseIdentifier: "HeaderView", for: indexPath) as? HeaderView
        else{
            return UICollectionReusableView()
        }
        switch indexPath.section{
        case 0:
            view.title = "Upcoming Events"
        case 1:
            view.title = "Latest Results"
        case 2:
            view.title = "Teams"
        default:
            view.title = "Upcoming Events"
        }
        
        return view
    }
}
