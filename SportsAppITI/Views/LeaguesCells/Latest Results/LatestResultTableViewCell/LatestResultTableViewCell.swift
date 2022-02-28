//
//  LatestResultTableViewCell.swift
//  SportsAppITI
//
//  Created by abdrahman on 27/02/2022.
//

import UIKit

class LatestResultTableViewCell: UITableViewCell {
    
    static let identifier = "LatestResultTableViewCell"

    @IBOutlet weak var homeTeam: UILabel!
    @IBOutlet weak var secondTeam: UILabel!
    @IBOutlet weak var homeTeamScore: UILabel!
    @IBOutlet weak var secondTeamScore: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var timeLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        configUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func configUI(){
        homeTeam.text = "Brighton"
        secondTeam.text = "Liverpool"
        homeTeamScore.text = "0"
        secondTeamScore.text = "2"
        dateLbl.text = "20/04/20"
        timeLbl.text = "10:00:00"
    }
    
}
