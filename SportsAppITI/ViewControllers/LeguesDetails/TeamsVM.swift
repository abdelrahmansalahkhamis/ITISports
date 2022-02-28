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
    
    
}
