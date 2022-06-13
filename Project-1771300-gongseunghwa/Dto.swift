//
//  Dto.swift
//  Project-1771300-gongseunghwa
//
//  Created by mac003 on 2022/06/13.
//


// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let hello = try? newJSONDecoder().decode(Hello.self, from: jsonData)

import Foundation

// MARK: - Hello
struct Hello: Codable {
    let tier, leagueID, queue, name: String
    let entries: [LeagueItemDTO]

    enum CodingKeys: String, CodingKey {
        case tier
        case leagueID = "leagueId"
        case queue, name, entries
    }
}

// MARK: - Entry
struct LeagueItemDTO: Codable {
    let summonerID, summonerName: String
    let leaguePoints: Int
    let rank: String
    let wins, losses: Int
    let veteran, inactive, freshBlood, hotStreak: Bool

    enum CodingKeys: String, CodingKey {
        case summonerID = "summonerId"
        case summonerName = "summonerName"
        case leaguePoints, rank, wins, losses, veteran, inactive, freshBlood, hotStreak
    }
}


