//
//  PlayerStruct.swift
//  NBA_Score
//
//  Created by Brian van de Velde on 08-01-19.
//  Copyright © 2019 Brian van de Velde. All rights reserved.
//

import UIKit

struct PlayersStats: Codable
{
    var _internal: InternalTest3
    var league: Standard3
}

struct InternalTest3: Codable
{
    var pubDateTime: String
    var xslt: String
    var eventName: String
}

struct Standard3: Codable
{
    var standard: [Player]
    var africa: [Player]
    var sacramento: [Player]
    var vegas: [Player]
    var utah: [Player]
}
//struct Welcome: Codable
//{
//    let welcomeInternal: Internal
//    let league: League
//    
//    enum CodingKeys: String, CodingKey
//    {
//        case welcomeInternal = "_internal"
//        case league
//    }
//}
//
//struct League: Codable
//{
//    let standard: Standard
//}
//
//struct Standard: Codable
//{
//    let teamID: String
//    let stats: Stats
//    
//    enum CodingKeys: String, CodingKey
//    {
//        case teamID = "teamId"
//        case stats
//    }
//}
//
//struct Stats: Codable
//{
//    let latest, careerSummary: CareerSummary
//    let regularSeason: RegularSeason
//}
//
//struct CareerSummary: Codable
//{
//    let tpp, ftp, fgp, ppg: String
//    let rpg, apg, bpg, mpg: String
//    let spg, assists, blocks, steals: String
//    let turnovers, offReb, defReb, totReb: String
//    let fgm, fga, tpm, tpa: String
//    let ftm, fta, pFouls, points: String
//    let gamesPlayed, gamesStarted, plusMinus, min: String
//    let dd2, td3: String
//    let seasonYear, seasonStageID: Int?
//    let topg, teamID: String?
//    
//    enum CodingKeys: String, CodingKey
//    {
//        case tpp, ftp, fgp, ppg, rpg, apg, bpg, mpg, spg, assists, blocks, steals, turnovers, offReb, defReb, totReb, fgm, fga, tpm, tpa, ftm, fta, pFouls, points, gamesPlayed, gamesStarted, plusMinus, min, dd2, td3, seasonYear
//        case seasonStageID = "seasonStageId"
//        case topg
//        case teamID = "teamId"
//    }
//}
//
//struct RegularSeason: Codable
//{
//    let season: [Season]
//}
//
//struct Season: Codable
//{
//    let seasonYear: Int
//    let teams: [CareerSummary]
//    let total: CareerSummary
//}
//
//struct Internal: Codable
//{
//    let pubDateTime, xslt, eventName: String
//}
