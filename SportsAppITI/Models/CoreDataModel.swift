//
//  CoreDataModel.swift
//  SportsAppITI
//
//  Created by abdrahman on 02/03/2022.
//

import Foundation

struct AllLeaguesCoreData{
    var leagues: [LeaguesCoreData]?
//    init(){
//        self.leagues = [LeaguesCoreData]()
//    }
}

struct LeaguesCoreData{
    let idLeague: String?
    let strLeague : String?
    let strBadge : String?
    let strYoutube: String?
}


//extension LeaguesCoreData{
//    static func getAllLeagues() -> AllLeaguesCoreData? {
//        CoreDataServices.instance.fetchData { allLeagues in
//            guard let allLeagues = allLeagues else {
//                return  nil
//            }
//            return allLeagues
//        }
//
//    }
//}
