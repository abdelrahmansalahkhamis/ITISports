//
//  SportsVC.swift
//  SportsAppITI
//
//  Created by abdrahman on 23/02/2022.
//

import UIKit

private let reuseIdentifier = "SportsCell"

class SportsVC: UICollectionViewController {
    
    var sportListViewModel = SportsListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        //self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        // Do any additional setup after loading the view.
        configureCollectionView()
    }
    
    func configureCollectionView(){
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .vertical
            layout.minimumLineSpacing = 1
            layout.minimumInteritemSpacing = 1
            layout.sectionInset = UIEdgeInsets(top: 0, left: 1, bottom: 0, right: 1)
        let size = (view.frame.size.width - 3) / 2
            layout.itemSize = CGSize(width: size, height: size)
            
            collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
            collectionView?.delegate = self
            collectionView?.dataSource = self
            collectionView?.backgroundColor = .clear
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
        cell.sportImg.image = UIImage(systemName: "gear")
        cell.sportTitle.text = vm.name
        // Configure the cell
        
    
        return cell
    }


}
