//
//  SportsCell.swift
//  SportsAppITI
//
//  Created by abdrahman on 23/02/2022.
//

import UIKit

class SportsCell: UICollectionViewCell {

    @IBOutlet weak var sportImg: UIImageView!
    @IBOutlet weak var sportTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        sportTitle.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.2)
        
    }

    
}
