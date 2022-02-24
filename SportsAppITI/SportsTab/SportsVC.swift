//
//  SportsVC.swift
//  SportsAppITI
//
//  Created by abdrahman on 23/02/2022.
//

import UIKit
import SDWebImage

private let reuseIdentifier = "SportsCell"

class SportsVC: UICollectionViewController {
    
    var sportListViewModel = SportsListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        getAllSports()
    }
    
    func getAllSports(){
        WebService.load(resource: Sport.allSports) { result in
            switch result{
            case .success(let sports):
                self.sportListViewModel.sportsViewModel = sports.sports.map( SportsVM.init)
                self.collectionView.reloadData()
            case .failure(let error):
                print("error is => \(error)")
            }
        }
    }
    
    func configureCollectionView(){
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .vertical
            layout.minimumLineSpacing = 1
            layout.minimumInteritemSpacing = 1
            layout.sectionInset = UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 5)
        let size = (view.frame.size.width - 25) / 2
            layout.itemSize = CGSize(width: size, height: size)
            
            collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
            
            collectionView?.backgroundColor = .systemBackground
            collectionView?.register(UINib(nibName: "SportsCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
            
            guard let collectionView = collectionView else {return}
            
            view.addSubview(collectionView)
            collectionView.frame = view.bounds
        }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return self.sportListViewModel.sportsViewModel.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let vm = self.sportListViewModel.sportViewModel(at: indexPath.row)
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? SportsCell else{
            return UICollectionViewCell()
        }
                
        //cell.sportImg.image = UIImage(systemName: "gear")
        cell.sportImg.sd_setImage(with: URL(string: vm.strSportThumb), placeholderImage: UIImage(systemName: "gear"))
        cell.sportTitle.text = vm.name
        // Configure the cell
        
    
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vm = self.sportListViewModel.sportViewModel(at: indexPath.row)
        //let
        performSegue(withIdentifier: "toLeagueVC", sender: vm)
    }
    
    

}
