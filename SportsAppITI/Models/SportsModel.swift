//
//  SportsModel.swift
//  SportsAppITI
//
//  Created by abdrahman on 24/02/2022.
//

import Foundation




struct AllSports: Codable {
    let sports: [Sport]
}

// MARK: - Sport
struct Sport: Codable {
    let idSport, strSport, strFormat: String
    let strSportThumb: String
    let strSportIconGreen: String
    let strSportDescription: String
}
extension Sport{
    
    static var allSports: Resource<AllSports> = {
        guard let url = URL(string: URLs.allSports) else{
            fatalError("URL Incorrect")
        }
        return Resource<AllSports>(url: url)
    }()
}
