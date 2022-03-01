//
//  TeamsCell.swift
//  SportsAppITI
//
//  Created by abdrahman on 26/02/2022.
//

import UIKit
import SDWebImage

class TeamsCell: UICollectionViewCell {
    
    static let identifier = "TeamsCell"

    @IBOutlet weak var teamImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configUI(vm: TeamVM){
        teamImg.sd_setImage(with: URL(string: vm.teamBadge), placeholderImage: UIImage(systemName: "gear"))
    }

}
