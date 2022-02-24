//
//  LeagueCell.swift
//  SportsAppITI
//
//  Created by abdrahman on 24/02/2022.
//

import UIKit

class LeagueCell: UITableViewCell {

    @IBOutlet weak var leagueImg: UIImageView!
    @IBOutlet weak var leagueLbl: UILabel!
    @IBOutlet weak var leagueBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        leagueImg.layer.cornerRadius = 30
        leagueImg.backgroundColor = .blue
        leagueImg.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
