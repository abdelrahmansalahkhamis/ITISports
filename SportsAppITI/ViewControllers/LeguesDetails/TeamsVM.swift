//
//  TeamsVM.swift
//  SportsAppITI
//
//  Created by abdrahman on 28/02/2022.
//

import Foundation

struct TeamVM{
    let team: Team
}

class TeamsListVM{
    var teamsVM: [TeamVM]
    init(){
        self.teamsVM = [TeamVM]()
    }
}

extension TeamsListVM{
    
    func teamViewModel(at index: Int) -> TeamVM{
        return self.teamsVM[index]
    }
}

extension TeamVM{
    
    var teamBadge:String{
        return self.team.strTeamBadge
    }
    
    var formedYear:String{
        return self.team.intFormedYear
    }
    var strBadge: String{
        return self.team.strTeamBadge
    }
    var strFormat: String{
        return self.team.strTeamFanart1
    }

    var strCountry:String{
        return self.team.strCountry
    }

    var strTeam:String{
        return self.team.strTeam
    }


    var strFacebook: String{
        return self.team.strFacebook
    }

    var strWebsite: String{
        return self.team.strWebsite
    }
    var strTeamFanart1: String{
        return self.team.strTeamFanart1
    }
}
