//
//  SportsModel.swift
//  SportsAppITI
//
//  Created by abdrahman on 24/02/2022.
//

import Foundation


//struct Welcome: Codable {
//    let sports: [Sport]
//}

// MARK: - Sport
struct Sport: Codable {
    let idSport, strSport: String
    let strFormat: StrFormat
    let strSportThumb: String
    let strSportIconGreen: String
    let strSportDescription: String
}

enum StrFormat: String, Codable {
    case eventSport = "EventSport"
    case teamvsTeam = "TeamvsTeam"
}


extension Sport{
    static var allSports: Resource<[Sport]> = {
        guard let url = URL(string: URLs.allSports) else{
            fatalError("URL Incorrect")
        }
        return Resource<[Sport]>(url: url)
    }()
}
