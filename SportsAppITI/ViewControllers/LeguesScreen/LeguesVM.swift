//
//  LeguesVM.swift
//  SportsAppITI
//
//  Created by abdrahman on 24/02/2022.
//

import Foundation


struct LeguesVM{
    let leagueItem: LeagueModel
    //var leaguesForSport: String?
}


class LeaguesListViewModel{
    var leaguesViewModel: [LeguesVM]
    
    init(){
        self.leaguesViewModel = [LeguesVM]()
    }
}

extension LeaguesListViewModel{
    
    func leaguesViewModel(at index: Int) -> LeguesVM{
        return self.leaguesViewModel[index]
    }
}


extension LeguesVM{
    
//    var id:String{
//        return self.leagueItem.idLeague
//    }
    var name: String{
        return self.leagueItem.strLeague
    }
    
    var strLeagueBadge:String{
        return self.leagueItem.strBadge
    }
    
}


