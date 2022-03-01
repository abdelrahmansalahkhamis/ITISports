//
//  TeamDetailsVM.swift
//  SportsAppITI
//
//  Created by abdrahman on 01/03/2022.
//

import Foundation

struct TeamDetailsVM{
    let teamItem: Team
}


extension TeamDetailsVM{
    
    var formedYear:String{
        return self.teamItem.intFormedYear
    }
    var strBadge: String{
        return self.teamItem.strTeamBadge
    }
    var strFormat: String{
        return self.teamItem.strTeamFanart1
    }

    var strCountry:String{
        return self.teamItem.strCountry
    }

    var strTeam:String{
        return self.teamItem.strTeam
    }


    var strFacebook: String{
        return self.teamItem.strFacebook
    }

    var strWebsite: String{
        return self.teamItem.strWebsite
    }
    var strTeamFanart1: String{
        return self.teamItem.strTeamFanart1
    }
    
}
