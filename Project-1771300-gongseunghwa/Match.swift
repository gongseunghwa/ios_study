//
//  Match.swift
//  Project-1771300-gongseunghwa
//
//  Created by mac003 on 2022/06/13.
//

import Foundation


// MARK: - Hello
struct Match: Codable {
    let metadata: Metadata
    let info: Info
}

// MARK: - Info
struct Info: Codable {
    let gameCreation, gameDuration, gameEndTimestamp, gameID: Int
    let gameMode, gameName: String
    let gameStartTimestamp: Int
    let gameType, gameVersion: String
    let mapID: Int
    let participantsInfo: [MatchParticipant]
    let platformID: String
    let queueID: Int
    let teamsInfo: [TeamStats]
    let tournamentCode: String

    enum CodingKeys: String, CodingKey {
        case gameCreation, gameDuration, gameEndTimestamp
        case gameID = "gameId"
        case gameMode, gameName, gameStartTimestamp, gameType, gameVersion
        case mapID = "mapId"
        case participantsInfo = "participants"
        case platformID = "platformId"
        case queueID = "queueId"
        case teamsInfo = "teams"
        case tournamentCode
    }
}

// MARK: - Participant
struct MatchParticipant: Codable {
    let assists, baronKills, bountyLevel: Int
    let challenges: [String: Double]
    let champExperience, champLevel, championID: Int
    let championName: String
    let championTransform, consumablesPurchased, damageDealtToBuildings, damageDealtToObjectives: Int
    let damageDealtToTurrets, damageSelfMitigated, deaths, detectorWardsPlaced: Int
    let doubleKills, dragonKills: Int
    let eligibleForProgression, firstBloodAssist, firstBloodKill, firstTowerAssist: Bool
    let firstTowerKill, gameEndedInEarlySurrender, gameEndedInSurrender: Bool
    let goldEarned, goldSpent: Int
    let individualPosition: String
    let inhibitorKills, inhibitorTakedowns, inhibitorsLost, item0: Int
    let item1, item2, item3, item4: Int
    let item5, item6, itemsPurchased, killingSprees: Int
    let kills: Int
    let lane: String
    let largestCriticalStrike, largestKillingSpree, largestMultiKill, longestTimeSpentLiving: Int
    let magicDamageDealt, magicDamageDealtToChampions, magicDamageTaken, neutralMinionsKilled: Int
    let nexusKills, nexusLost, nexusTakedowns, objectivesStolen: Int
    let objectivesStolenAssists, participantID, pentaKills: Int
    let perks: Perks
    let physicalDamageDealt, physicalDamageDealtToChampions, physicalDamageTaken, profileIcon: Int
    let puuid: String
    let quadraKills: Int
    let riotIDName, riotIDTagline, role: String
    let sightWardsBoughtInGame, spell1Casts, spell2Casts, spell3Casts: Int
    let spell4Casts, summoner1Casts, summoner1ID, summoner2Casts: Int
    let summoner2ID: Int
    let summonerID: String
    let summonerLevel: Int
    let summonerName: String
    let teamEarlySurrendered: Bool
    let teamID: Int
    let teamPosition: String
    let timeCCingOthers, timePlayed, totalDamageDealt, totalDamageDealtToChampions: Int
    let totalDamageShieldedOnTeammates, totalDamageTaken, totalHeal, totalHealsOnTeammates: Int
    let totalMinionsKilled, totalTimeCCDealt, totalTimeSpentDead, totalUnitsHealed: Int
    let tripleKills, trueDamageDealt, trueDamageDealtToChampions, trueDamageTaken: Int
    let turretKills, turretTakedowns, turretsLost, unrealKills: Int
    let visionScore, visionWardsBoughtInGame, wardsKilled, wardsPlaced: Int
    let win: Bool

    enum CodingKeys: String, CodingKey {
        case assists, baronKills, bountyLevel, challenges, champExperience, champLevel
        case championID = "championId"
        case championName, championTransform, consumablesPurchased, damageDealtToBuildings, damageDealtToObjectives, damageDealtToTurrets, damageSelfMitigated, deaths, detectorWardsPlaced, doubleKills, dragonKills, eligibleForProgression, firstBloodAssist, firstBloodKill, firstTowerAssist, firstTowerKill, gameEndedInEarlySurrender, gameEndedInSurrender, goldEarned, goldSpent, individualPosition, inhibitorKills, inhibitorTakedowns, inhibitorsLost, item0, item1, item2, item3, item4, item5, item6, itemsPurchased, killingSprees, kills, lane, largestCriticalStrike, largestKillingSpree, largestMultiKill, longestTimeSpentLiving, magicDamageDealt, magicDamageDealtToChampions, magicDamageTaken, neutralMinionsKilled, nexusKills, nexusLost, nexusTakedowns, objectivesStolen, objectivesStolenAssists
        case participantID = "participantId"
        case pentaKills, perks, physicalDamageDealt, physicalDamageDealtToChampions, physicalDamageTaken, profileIcon, puuid, quadraKills
        case riotIDName = "riotIdName"
        case riotIDTagline = "riotIdTagline"
        case role, sightWardsBoughtInGame, spell1Casts, spell2Casts, spell3Casts, spell4Casts, summoner1Casts
        case summoner1ID = "summoner1Id"
        case summoner2Casts
        case summoner2ID = "summoner2Id"
        case summonerID = "summonerId"
        case summonerLevel, summonerName, teamEarlySurrendered
        case teamID = "teamId"
        case teamPosition, timeCCingOthers, timePlayed, totalDamageDealt, totalDamageDealtToChampions, totalDamageShieldedOnTeammates, totalDamageTaken, totalHeal, totalHealsOnTeammates, totalMinionsKilled, totalTimeCCDealt, totalTimeSpentDead, totalUnitsHealed, tripleKills, trueDamageDealt, trueDamageDealtToChampions, trueDamageTaken, turretKills, turretTakedowns, turretsLost, unrealKills, visionScore, visionWardsBoughtInGame, wardsKilled, wardsPlaced, win
    }
}

// MARK: - Perks
struct Perks: Codable {
    let statPerks: StatPerks
    let styles: [Style]
}

// MARK: - StatPerks
struct StatPerks: Codable {
    let defense, flex, offense: Int
}

// MARK: - Style
struct Style: Codable {
    let styleDescription: Description
    let selections: [Selection]
    let style: Int

    enum CodingKeys: String, CodingKey {
        case styleDescription = "description"
        case selections, style
    }
}

// MARK: - Selection
struct Selection: Codable {
    let perk, var1, var2, var3: Int
}

enum Description: String, Codable {
    case primaryStyle = "primaryStyle"
    case subStyle = "subStyle"
}

// MARK: - Team
struct TeamStats: Codable {
    let bans: [Ban]
    let objectives: Objectives
    let teamID: Int
    let win: Bool

    enum CodingKeys: String, CodingKey {
        case bans, objectives
        case teamID = "teamId"
        case win
    }
}

// MARK: - Ban
struct Ban: Codable {
    let championID, pickTurn: Int

    enum CodingKeys: String, CodingKey {
        case championID = "championId"
        case pickTurn
    }
}

// MARK: - Objectives
struct Objectives: Codable {
    let baron, champion, dragon, inhibitor: Baron
    let riftHerald, tower: Baron
}

// MARK: - Baron
struct Baron: Codable {
    let first: Bool
    let kills: Int
}

// MARK: - Metadata
struct Metadata: Codable {
    let dataVersion, matchID: String
    let participants: [String]

    enum CodingKeys: String, CodingKey {
        case dataVersion
        case matchID = "matchId"
        case participants
    }
}
