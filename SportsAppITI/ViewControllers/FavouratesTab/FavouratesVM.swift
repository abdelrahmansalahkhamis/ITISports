//
//  FavouratesVM.swift
//  SportsAppITI
//
//  Created by abdrahman on 23/02/2022.
//

import Foundation

struct FavouratesVM{
    let leagueItem: LeaguesCoreData
}


class FavouratesListViewModel{
    var leaguesViewModel: [FavouratesVM]
    init(){
        self.leaguesViewModel = [FavouratesVM]()
    }
}

extension FavouratesListViewModel{
    
    func leaguesViewModel(at index: Int) -> FavouratesVM{
        return self.leaguesViewModel[index]
    }
}


extension FavouratesVM{
    var id:String{
        return self.leagueItem.idLeague ?? ""
    }
    var name: String{
        return self.leagueItem.strLeague ?? ""
    }
    var strBadge: String{
        return self.leagueItem.strBadge ?? ""
    }
    
    var strYoutube:String{
        return self.leagueItem.strYoutube ?? ""
    }
}


//struct Sport{
//    var name:String
//    var coffeeName:String
//    var total:Double
//    var size:String
//}
