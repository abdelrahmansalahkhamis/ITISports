//
//  TeamsModel.swift
//  SportsAppITI
//
//  Created by abdrahman on 27/02/2022.
//

import Foundation


//struct AllTeams: Codable {
//    let teams: [Team]
//}
//
//
//struct Team: Codable {
//    let idTeam, strTeam, strSport, strLeague: String
//    let idLeague, strCountry: String
//    let strTeamBadge, strTeamLogo: String
//}
//
//extension Team{
//
//    static var allTeams: Resource<AllTeams> = {
//        guard let url = URL(string: URLs.allTeams) else{
//            fatalError("URL Incorrect")
//        }
//
//        return Resource<AllTeams>(url: url)
//    }()
//}


struct AllTeams: Codable{
    let teams: [Team]
}

struct Team: Codable{
    let strTeamBadge: String
    let strTeam: String
    let intFormedYear: String
    let strCountry: String
    //let strTeamLogo: String
    //let strTeamJersey: String
    let strStadiumLocation: String
    let strFacebook: String
    let strTeamFanart1: String
    let strWebsite: String
    //let strStadiumLocation: String
}

extension Team{
    
    static func getAllTeams(for league: String) -> Resource<AllTeams>{
        
            guard let url = URL(string: URLs.allTeams + league) else{
                
                //throw NetworkError.domainError
                fatalError("URL Incorrect")
                //return Resource<AllTeams>(url: URL(string: "")!)
            }
            return Resource<AllTeams>(url: url)

    }
//    static var allTeams: Resource<AllTeams> = {
//        guard let url = URL(string: URLs.allTeams) else{
//            fatalError("URL Incorrect")
//        }
//        print("all events url is :- \(URLs.allEvents)")
//        return Resource<AllTeams>(url: url)
//    }()
}
