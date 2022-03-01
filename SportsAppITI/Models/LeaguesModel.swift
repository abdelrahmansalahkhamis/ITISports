//
//  Leagues.swift
//  SportsAppITI
//
//  Created by abdrahman on 24/02/2022.
//

import Foundation

//struct AllLeagues:Codable {
//    let countrys: [League]
//}
//
//struct League: Codable {
//    let idLeague: String
//    let idSoccerXML, idAPIfootball: JSONNull?
//    let strSport, strLeague, strLeagueAlternate, intDivision: String
//    let idCup, strCurrentSeason, intFormedYear, dateFirstEvent: String
//    let strGender, strCountry, strWebsite, strFacebook: String
//    let strInstagram: JSONNull?
//    let strTwitter, strYoutube, strRSS, strDescriptionEN: String
//    let strDescriptionDE, strDescriptionFR, strDescriptionIT, strDescriptionCN: JSONNull?
//    let strDescriptionJP, strDescriptionRU, strDescriptionES, strDescriptionPT: JSONNull?
//    let strDescriptionSE, strDescriptionNL, strDescriptionHU, strDescriptionNO: JSONNull?
//    let strDescriptionPL, strDescriptionIL, strTvRights: JSONNull?
//    let strFanart1, strFanart2, strFanart3, strFanart4: String
//    let strBanner: String
//    let strBadge, strLogo: String
//    let strPoster: String
//    let strTrophy: String
//    let strNaming: String
//    let strComplete: JSONNull?
//    let strLocked: String
//}
//
//class JSONNull: Codable, Hashable {
//
//    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
//        return true
//    }
//
//    public var hashValue: Int {
//        return 0
//    }
//
//    public init() {}
//
//    public required init(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
//        if !container.decodeNil() {
//            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
//        }
//    }
//
//    public func encode(to encoder: Encoder) throws {
//        var container = encoder.singleValueContainer()
//        try container.encodeNil()
//    }
//}
//
//extension League{
//    static func getAllLeagues(_ sport: String) -> Resource<AllLeagues> {
//
//            guard let url = URL(string: URLs.allleagues + sport) else{
//                fatalError("URL Incorrect")
//            }
//            return Resource<AllLeagues>(url: url)
//
//    }
//}


import Foundation
struct LeagueModel : Codable {
    let strLeague : String
    let strBadge : String
    let strYoutube: String

//    enum CodingKeys: String, CodingKey {
//
//        case strLeague = "strLeague"
//        case strBadge = "strBadge"
//    }

//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//
//        strLeague = try values.decodeIfPresent(String.self, forKey: .strLeague) ?? ""
//        strBadge = try values.decodeIfPresent(String.self, forKey: .strBadge) ?? ""
//    }
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
    

//    enum CodingKeys: String, CodingKey {
//
//        case countrys = "countrys"
//    }
//
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        countrys = try values.decodeIfPresent([Countrys].self, forKey: .countrys)!
//    }
}
