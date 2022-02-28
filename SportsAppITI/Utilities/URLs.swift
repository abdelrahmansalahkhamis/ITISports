//
//  URLs.swift
//  SportsAppITI
//
//  Created by abdrahman on 24/02/2022.
//

import Foundation

struct URLs{
    static let main = "https://www.thesportsdb.com/api/v1/json/2/"
    static let allSports = main + "all_sports.php"
    static let allleagues =  main + "search_all_leagues.php?s="
    static let allTeams = main + "search_all_teams.php?l="
    static let allEvents = main + "eventsseason.php?id=4328&s=2021-2022"
    // https://www.thesportsdb.com/api/v1/json/2/search_all_teams.php?l=V8%20Supercars
    // https://www.thesportsdb.com/api/v1/json/2/search_all_leagues.php?s=Motorsport
    
    // https://www.thesportsdb.com/api/v1/json/2/eventsround.php?id=4328&r=38&s=2021-2022
    // https://www.thesportsdb.com/api/v1/json/2/eventsseason.php?id=4328&s=2021-2022
    
    
    // https://www.thesportsdb.com/api/v1/json/2/eventsseason.php?id=4328&s=2021-2022
}
