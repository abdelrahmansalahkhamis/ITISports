//
//  Leagues.swift
//  SportsAppITI
//
//  Created by abdrahman on 24/02/2022.
//

import Foundation


import Foundation
struct LeagueModel : Codable {
    let idLeague: String
    let strLeague : String
    let strBadge : String
    let strYoutube: String

}

extension LeagueModel{
    static func getAllLeagues(_ sport: String) -> Resource<AllLeagues> {

            guard let url = URL(string: URLs.allleagues + sport) else{
                //return
                fatalError("URL Incorrect")
            }
            return Resource<AllLeagues>(url: url)

    }
}

struct AllLeagues : Codable {
    
    let countrys : [LeagueModel]

}
