//
//  EventsModel.swift
//  SportsAppITI
//
//  Created by abdrahman on 28/02/2022.
//

import Foundation
//
//struct AllEvents: Codable {
//    let events: [Event]
//}
//
//// MARK: - Event
//struct Event: Codable {
//    let idEvent, idAPIfootball, strEvent, strEventAlternate: String
//    let strFilename, strSport, idLeague, strLeague: String
//    let strSeason, strDescriptionEN, strHomeTeam, strAwayTeam: String
//    let intHomeScore, intRound, intAwayScore, strOfficial: String
//    let strTimestamp: Date
//    let dateEvent, dateEventLocal, strTime, strTimeLocal: String
//    let idHomeTeam, idAwayTeam, strResult, strVenue: String
//    let strCountry, strCity, strPoster, strSquare: String
//    let strThumb: String
//    let strBanner: String
//    let strTweet1: String
//    let strTweet2, strTweet3: String
//    let strVideo: String
//    let strStatus, strPostponed, strLocked: String
//}
//
//extension Event{
//    static var allEvents: Resource<AllEvents> = {
//        guard let url = URL(string: URLs.allEvents) else{
//            fatalError("URL Incorrect")
//        }
//        return Resource<AllEvents>(url: url)
//    }()
//}


//import Foundation
//
//// MARK: - Welcome
//struct AllEvents: Codable {
//    let events: [Event]
//}
//
//// MARK: - Event
//struct Event: Codable {
//    let idEvent: String
//    let idSoccerXML: JSONNull?
//    let idAPIfootball, strEvent, strEventAlternate, strFilename: String
//    let strSport: StrSport
//    let idLeague: String
//    let strLeague: StrLeague
//    let strSeason: StrSeason
//    let strDescriptionEN, strHomeTeam, strAwayTeam, intHomeScore: String
//    let intRound, intAwayScore: String
//    let intSpectators: JSONNull?
//    let strOfficial: String
//    let strTimestamp: Date
//    let dateEvent, dateEventLocal, strTime, strTimeLocal: String
//    let strTVStation: JSONNull?
//    let idHomeTeam, idAwayTeam, strResult, strVenue: String
//    let strCountry: StrCountry
//    let strCity: String
//    let strPoster: String
//    let strSquare: String
//    let strFanart: JSONNull?
//    let strThumb: String
//    let strBanner: String
//    let strMap: JSONNull?
//    let strTweet1, strTweet2, strTweet3, strVideo: String
//    let strStatus: StrStatus
//    let strPostponed: StrPostponed
//    let strLocked: StrLocked
//}
//
//extension Event{
//    static var allEvents: Resource<AllEvents> = {
//        guard let url = URL(string: URLs.allEvents) else{
//            fatalError("URL Incorrect")
//        }
//        return Resource<AllEvents>(url: url)
//    }()
//}
//
//enum StrCountry: String, Codable {
//    case england = "England"
//}
//
//enum StrLeague: String, Codable {
//    case englishPremierLeague = "English Premier League"
//}
//
//enum StrLocked: String, Codable {
//    case unlocked = "unlocked"
//}
//
//enum StrPostponed: String, Codable {
//    case no = "no"
//}
//
//enum StrSeason: String, Codable {
//    case the20212022 = "2021-2022"
//}
//
//enum StrSport: String, Codable {
//    case soccer = "Soccer"
//}
//
//enum StrStatus: String, Codable {
//    case matchFinished = "Match Finished"
//}
//
//// MARK: - Encode/decode helpers
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


struct AllEvents: Codable{
    let events: [Event]
//    enum CodingKeys: String, CodingKey {
//
//            case events = "events"
//        }

//    init(from decoder: Decoder) throws {
//            let values = try decoder.container(keyedBy: CodingKeys.self)
//            events = try values.decodeIfPresent([Event].self, forKey: .events)
//        }
}

struct Event: Codable{
    let idEvent: String
    let strEvent: String
    let strHomeTeam: String
    let strAwayTeam: String
    let intHomeScore: String
    let intAwayScore: String
    let dateEvent: String
    let strTime: String
//    enum CodingKeys: String, CodingKey {
//        case idEvent = "idEvent"
//        case strEvent = "strEvent"
//        case strHomeTeam = "strHomeTeam"
//        case strAwayTeam = "strAwayTeam"
//        case intHomeScore = "intHomeScore"
//        case intAwayScore = "intAwayScore"
//        case dateEvent = "dateEvent"
//        case strTime = "strTime"
//    }
    
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        idEvent = try values.decodeIfPresent(String.self, forKey: .idEvent)
//        strEvent = try values.decodeIfPresent(String.self, forKey: .strEvent)
//        strHomeTeam = try values.decodeIfPresent(String.self, forKey: .strHomeTeam)
//        strAwayTeam = try values.decodeIfPresent(String.self, forKey: .strAwayTeam)
//        intHomeScore = try values.decodeIfPresent(String.self, forKey: .intHomeScore)
//        intAwayScore = try values.decodeIfPresent(String.self, forKey: .intAwayScore)
//        dateEvent = try values.decodeIfPresent(String.self, forKey: .dateEvent)
//        strTime = try values.decodeIfPresent(String.self, forKey: .strTime)
//    }
}

extension Event{
    static var allEvents: Resource<AllEvents> = {
        guard let url = URL(string: URLs.allEvents) else{
            fatalError("URL Incorrect")
        }
        print("all events url is :- \(URLs.allEvents)")
        return Resource<AllEvents>(url: url)
    }()
}
