//
//  UpcomingEventsCell.swift
//  SportsAppITI
//
//  Created by abdrahman on 26/02/2022.
//

import UIKit

class UpcomingEventsCell: UICollectionViewCell {
    
    static let identifier = "UpcomingEventsCell"

    @IBOutlet weak var firstTeam: UILabel!
    @IBOutlet weak var secondTeam: UILabel!
    @IBOutlet weak var eventDate: UILabel!
    @IBOutlet weak var eventTime: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configUI(eventName: String, eveitDate: String, eventTime: String){
        self.firstTeam.text = eventName
        self.secondTeam.text = eventName
        self.eventDate.text = eveitDate
        self.eventTime.text = eventTime
    }

}
