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
}

struct Latest: Codable
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
    var offReb: String
    var defReb: String
    var totReb: String
    var fgm: String
    var fga: String
    var ftm: String
    var fta: String
    var gamesPlayed: String
    
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
        case offReb
        case defReb
        case totReb
        case fgm
        case fga
        case ftm
        case fta
        case gamesPlayed
    }
}
