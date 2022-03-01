//
//  LatestResultTableViewCell.swift
//  SportsAppITI
//
//  Created by abdrahman on 27/02/2022.
//

import UIKit

class LatestResultTableViewCell: UITableViewCell {
    
    static let identifier = "LatestResultTableViewCell"

    @IBOutlet weak var homeTeamVSAwayTeam: UILabel!
    @IBOutlet weak var homeTeamScore: UILabel!
    @IBOutlet weak var awayTeamScore: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var timeLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func configUI(vm: LatestResultsVM){
        homeTeamVSAwayTeam.text = vm.strEvent
        homeTeamScore.text = vm.intHomeScore
        awayTeamScore.text = vm.intAwayScore
        dateLbl.text = vm.eventDate
        timeLbl.text = vm.eventTime
    }
    
}
