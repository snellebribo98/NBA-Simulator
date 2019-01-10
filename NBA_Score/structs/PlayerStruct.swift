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
    var standard: Data
}

struct Data: Codable
{
    var teamId: String
    var stats: Stats
}

struct Stats: Codable
{
    var latest: Latest
    var careerSummary: CareerSummary
    var regularSeason: RegularSeason
}

struct Latest: Codable
{
    var seasonYear: Int
    var seasonStageId: Int
    var ppg: String
    var rpg: String
    var apg: String
    var mpg: String
    var topg: String
    var spg: String
    var bpg: String
    var tpp: String
    var ftp: String
    var fgp: String
    var assists: String
    var blocks: String
    var steals: String
    var turnovers: String
    var offReb: String
    var defReb: String
    var totReb: String
    var fgm: String
    var fga: String
    var tpm: String
    var tpa: String
    var ftm: String
    var fta: String
    var pFouls: String
    var points: String
    var gamesPlayed: String
    var gamesStarted: String
    var plusMinus: String
    var min: String
    var dd2: String
    var td3: String
    
    enum CodingKeys: String, CodingKey
    {
        case seasonYear
        case seasonStageId
        case ppg
        case rpg
        case apg
        case mpg
        case topg
        case spg
        case bpg
        case tpp
        case ftp
        case fgp
        case assists
        case blocks
        case steals
        case turnovers
        case offReb
        case defReb
        case totReb
        case fgm
        case fga
        case tpm
        case tpa
        case ftm
        case fta
        case pFouls
        case points
        case gamesPlayed
        case gamesStarted
        case plusMinus
        case min
        case dd2
        case td3
    }
}

struct CareerSummary: Codable
{
    var tpp: String
    var ftp: String
    var fgp: String
    var ppg: String
    var rpg: String
    var apg: String
    var bpg: String
    var mpg: String
    var spg: String
    var assists: String
    var blocks: String
    var steals: String
    var turnovers: String
    var offReb: String
    var defReb: String
    var totReb: String
    var fgm: String
    var fga: String
    var tpm: String
    var tpa: String
    var ftm: String
    var fta: String
    var pFouls: String
    var points: String
    var gamesPlayed: String
    var gamesStarted: String
    var plusMinus: String
    var min: String
    var dd2: String
    var td3: String
    
    enum CodingKeys: String, CodingKey
    {
        case tpp
        case ftp
        case fgp
        case ppg
        case rpg
        case apg
        case bpg
        case mpg
        case spg
        case assists
        case blocks
        case steals
        case turnovers
        case offReb
        case defReb
        case totReb
        case fgm
        case fga
        case tpm
        case tpa
        case ftm
        case fta
        case pFouls
        case points
        case gamesPlayed
        case gamesStarted
        case plusMinus
        case min
        case dd2
        case td3
    }
}

struct RegularSeason: Codable
{
    var season: [Season]
}

struct Season: Codable
{
    var seasonYear: Int
    var teams: [TeamsPlayedFor]
    var total: Total
}

struct TeamsPlayedFor: Codable
{
    var teamId: String
    var ppg: String
    var rpg: String
    var apg: String
    var mpg: String
    var topg: String
    var spg: String
    var bpg: String
    var tpp: String
    var ftp: String
    var fgp: String
    var assists: String
    var blocks: String
    var steals: String
    var turnovers: String
    var offReb: String
    var defReb: String
    var totReb: String
    var fgm: String
    var fga: String
    var tpm: String
    var tpa: String
    var ftm: String
    var fta: String
    var pFouls: String
    var points: String
    var gamesPlayed: String
    var gamesStarted: String
    var plusMinus: String
    var min: String
    var dd2: String
    var td3: String
    
    enum CodingKeys: String, CodingKey
    {
        case teamId
        case ppg
        case rpg
        case apg
        case mpg
        case topg
        case spg
        case bpg
        case tpp
        case ftp
        case fgp
        case assists
        case blocks
        case steals
        case turnovers
        case offReb
        case defReb
        case totReb
        case fgm
        case fga
        case tpm
        case tpa
        case ftm
        case fta
        case pFouls
        case points
        case gamesPlayed
        case gamesStarted
        case plusMinus
        case min
        case dd2
        case td3
    }
}

struct Total: Codable
{
    var ppg: String
    var rpg: String
    var apg: String
    var mpg: String
    var topg: String
    var spg: String
    var bpg: String
    var tpp: String
    var ftp: String
    var fgp: String
    var assists: String
    var blocks: String
    var steals: String
    var turnovers: String
    var offReb: String
    var defReb: String
    var totReb: String
    var fgm: String
    var fga: String
    var tpm: String
    var tpa: String
    var ftm: String
    var fta: String
    var pFouls: String
    var points: String
    var gamesPlayed: String
    var gamesStarted: String
    var plusMinus: String
    var min: String
    var dd2: String
    var td3: String
    
    enum CodingKeys: String, CodingKey
    {
        case ppg
        case rpg
        case apg
        case mpg
        case topg
        case spg
        case bpg
        case tpp
        case ftp
        case fgp
        case assists
        case blocks
        case steals
        case turnovers
        case offReb
        case defReb
        case totReb
        case fgm
        case fga
        case tpm
        case tpa
        case ftm
        case fta
        case pFouls
        case points
        case gamesPlayed
        case gamesStarted
        case plusMinus
        case min
        case dd2
        case td3
    }
}
