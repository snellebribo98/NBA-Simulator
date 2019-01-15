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
    var apg: String
    var mpg: String
    var topg: String
    var spg: String
    var bpg: String
    var offReb: String
    var defReb: String
    var fgm: String
    var fga: String
    var ftm: String
    var fta: String
    var gamesPlayed: String
}
