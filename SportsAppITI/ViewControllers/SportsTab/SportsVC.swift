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
//        CoreDataServices.instance.fetchData { allLeagues in
//            print("done ;)")
//        }
//        CoreDataServices.instance.deleteData { sucess in
//            if sucess{
//                print("sucess")
//            }else{
//                print("failed")
//            }
//        }
        getAllSports()
    }
    
    func getAllSports(){
        let activityIndicator = UIActivityIndicatorView(style: .large)
        self.view.addSubview(activityIndicator)
        activityIndicator.center = view.center
        activityIndicator.startAnimating()
        WebService.load(resource: Sport.allSports) { result in
            switch result{
            case .success(let sports):
                self.sportListViewModel.sportsViewModel = sports.sports.map( SportsVM.init)
                self.collectionView.reloadData()
                activityIndicator.stopAnimating()
            case .failure(let error):
                print("error is => \(error)")
                activityIndicator.stopAnimating()
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
            
        }
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.sportListViewModel.sportsViewModel.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let vm = self.sportListViewModel.sportViewModel(at: indexPath.row)
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? SportsCell else{
            return UICollectionViewCell()
        }
        cell.sportImg.sd_setImage(with: URL(string: vm.strSportThumb), placeholderImage: UIImage(systemName: "gear"))
        cell.sportTitle.text = vm.name
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vm = self.sportListViewModel.sportViewModel(at: indexPath.row)
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "LeguesVC", creator: {
                (coder) -> LeguesVC? in
            return LeguesVC(coder: coder, sport: vm.name)
            })
        self.navigationController?.pushViewController(vc, animated: true)
            //present(vc, animated: true, completion: nil)
    }
    
}
