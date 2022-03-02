//
//  UpcomingEventsCell.swift
//  SportsAppITI
//
//  Created by abdrahman on 26/02/2022.
//

import UIKit

class UpcomingEventsCell: UICollectionViewCell {
    
    static let identifier = "UpcomingEventsCell"

    
    @IBOutlet weak var eventLbl: UILabel!
    @IBOutlet weak var eventDate: UILabel!
    @IBOutlet weak var eventTime: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configUI(vm: UpcomingEventVM){
//        self.firstTeam.text = vm.eventName
//        self.secondTeam.text = vm.eventName
        self.eventLbl.text = vm.eventName
        self.eventDate.text = vm.eventDate
        self.eventTime.text = vm.eventTime
    }

}
