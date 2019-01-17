//
//  PlayerStruct.swift
//  NBA_Score
//
//  Created by Brian van de Velde on 08-01-19.
//  Copyright © 2019 Brian van de Velde. All rights reserved.
//

import UIKit

struct TempPlayersStats: Codable
{
    var league: Standard3
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
    var latest: PlayerStats
}

struct PlayerStats: Codable
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
    
    var overallRating: Double {
        var rating: Double?
        if ((Double(ftm)!/Double(fta)!) * 100) - 75 == Double.nan
        {
            print("Hier")
            rating = (Double(ppg)! * 1.5) + (Double(apg)! * 2) + (Double(topg)! * -3) + (Double(spg)! * 5) + (Double(bpg)! * 5) + (Double(offReb)! * 2) + (Double(defReb)! * 2) + (((Double(fgm)!/Double(fga)!) * 100) - 45)
        }
        else if ((Double(fgm)!/Double(fga)!) * 100) - 45 == Double.nan
        {
            print("Hier2")
            rating = (Double(ppg)! * 1.5) + (Double(apg)! * 2) + (Double(topg)! * -3) + (Double(spg)! * 5) + (Double(bpg)! * 5) + (Double(offReb)! * 2) + (Double(defReb)! * 2) + (((Double(ftm)!/Double(fta)!) * 100) - 75)
        }
        else
        {
            rating = (Double(ppg)! * 1.5) + (Double(apg)! * 2) + (Double(topg)! * -3) + (Double(spg)! * 5) + (Double(bpg)! * 5) + (Double(offReb)! * 2) + (Double(defReb)! * 2) + (((Double(fgm)!/Double(fga)!) * 100) - 45) + (((Double(ftm)!/Double(fta)!) * 100) - 75)
        }
        return rating!
    }
    
    var overallRatingWeighted: Double {
        return overallRating * ((100 / 240 * Double(mpg)!) / 100)
    }
    
    var defensiveRating: Double {
        return (Double(ppg)! * 1) + (Double(apg)! * 1) + (Double(topg)! * -1.5) + (Double(spg)! * 10) + (Double(bpg)! * 10) + (Double(offReb)! * 1) + (Double(defReb)! * 5)
    }
    
    var defensiveRatingWeighted: Double {
        return defensiveRating * ((100 / 240 * Double(mpg)!) / 100)
    }

    var offensiveRating: Double {
        return (Double(ppg)! * 2.5) + (Double(apg)! * 3) + (Double(topg)! * -4) + (Double(spg)! * 2.5) + (Double(bpg)! * 2.5) + (Double(offReb)! * 10) + (Double(defReb)! * 1)
    }
    
    var offensiveRatingWeighted: Double {
        return offensiveRating * ((100 / 240 * Double(mpg)!) / 100)
    }
}
