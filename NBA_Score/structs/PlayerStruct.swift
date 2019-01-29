//
//  PlayerStruct.swift
//  NBA_Score
//
//  Created by Brian van de Velde on 08-01-19.
//  Copyright © 2019 Brian van de Velde. All rights reserved.
//
//  Player stats struct, that calculates the individual ratings of each player. If some of the variables used to create such a rating isn't a value, use the rest of the variables that are a number. Also calculates the rating based on the minutes the player played, the sum of this rating along with the rest of the players in the team will result in the team ratings.


import UIKit

struct TempPlayersStats: Codable {
    var league: Standard3
}

struct Standard3: Codable {
    var standard: Data
}

struct Data: Codable {
    var teamId: String
    var stats: Stats
}

struct Stats: Codable {
    var latest: PlayerStats
}

struct PlayerStats: Codable {
    var ppg: String
    var apg: String
    var rpg: String
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
    
    var ftRating: Double {
        if ((Double(ftm)!/Double(fta)!) * 100) - 76.4 == Double.nan {
            return 0
        }
        else if Double(fta) == 0.0 {
            return 0
        }
        else {
            let x = ((Double(ftm)!/Double(fta)!) * 100) - 76.4
            if x >= 0 {
                return x
            }
            else {
                return 0
            }
        }
    }
    
    var fgRating: Double {
        if ((Double(fgm)!/Double(fga)!) * 100) - 46 == Double.nan {
            return 0
        }
        else if Double(fga) == 0.0 {
            return 0
        }
        else {
            let x = ((Double(fgm)!/Double(fga)!) * 100) - 46
            if x >= 0 {
                return x
            }
            else {
                return 0
            }
        }
    }
    
    var offRebpg: Double {
        if (Double(offReb)! / Double(gamesPlayed)!) == Double.nan {
            return 0
        }
        else if Double(gamesPlayed) == 0.0 {
            return 0
        }
        else {
            let x = (Double(offReb)! / Double(gamesPlayed)!)
            if x >= 0 {
                return x
            }
            else {
                return 0
            }
        }
    }
    
    var defRebpg: Double {
        if (Double(defReb)! / Double(gamesPlayed)!) == Double.nan {
            return 0
        }
        else if Double(gamesPlayed) == 0.0 {
            return 0
        }
        else {
            let x = (Double(defReb)! / Double(gamesPlayed)!)
            if x >= 0 {
                return x
            }
            else {
                return 0
            }
        }
    }
    
    var mpgRating: Double {
        if ((100 / 240 * Double(mpg)!) / 100) == Double.nan {
            return 0
        }
        else {
            let x = ((100 / 240 * Double(mpg)!) / 100)
            if x >= 0 {
                return x
            }
            else {
                return 0
            }
        }
    }
    
    var overallRating: Int {
        if (Double(ppg)! * 2) + (Double(apg)! * 2) + (Double(topg)! * -1) + (Double(spg)! * 3) + (Double(bpg)! * 3) + (offRebpg * 2) + (defRebpg * 2) + fgRating + ftRating < 0 {
            return 0
        }
        else if Double(mpg) == -1.0 {
            return 0
        }
        else {
            let x = (Double(ppg)! * 2) + (Double(apg)! * 2) + (Double(topg)! * -1) + (Double(spg)! * 3) + (Double(bpg)! * 3) + (offRebpg * 2) + (defRebpg * 2) + fgRating + ftRating
            let y = Int((x * 1).rounded() / 1)
            return y
        }
    }
    
    var overallRatingWeighted: Int {
        if Double(mpg) == 0.0 {
            return 0
        }
        else {
            let x = Double(overallRating) * mpgRating
            let y = Int((x * 1).rounded() / 1)
            return y
        }
    }
    
    var defensiveRating: Int {
        if (Double(ppg)! * 1.5) + (Double(apg)! * 1.5) + (Double(topg)! * -2) + (Double(spg)! * 6) + (Double(bpg)! * 6) + (offRebpg * 1) + (defRebpg * 3) < 0 {
            return 0
        }
        else if Double(mpg) == -1.0 {
            return 0
        }
        else {
            let x = (Double(ppg)! * 1.5) + (Double(apg)! * 1.5) + (Double(topg)! * -2) + (Double(spg)! * 6) + (Double(bpg)! * 6) + (offRebpg * 1) + (defRebpg * 3)
            let y = Int((x * 1).rounded() / 1)
            return y
        }
    }
    
    var defensiveRatingWeighted: Int {
        if Double(mpg) == 0.0 {
            return 0
        }
        else {
            let x = Double(defensiveRating) * mpgRating
            let y = Int((x * 1).rounded() / 1)
            return y
        }
    }

    var offensiveRating: Int {
        if (Double(ppg)! * 2.5) + (Double(apg)! * 2.5) + (Double(topg)! * -3) + (Double(spg)! * 2) + (Double(bpg)! * 2) + (offRebpg * 10) + (defRebpg * 1) < 0 {
            return 0
        }
        else if Double(mpg) == -1.0 {
            return 0
        }
        else {
            let x = (Double(ppg)! * 2.5) + (Double(apg)! * 2.5) + (Double(topg)! * -3) + (Double(spg)! * 2) + (Double(bpg)! * 2) + (offRebpg * 10) + (defRebpg * 1)
            let y = Int((x * 1).rounded() / 1)
            return y
        }
    }
    
    var offensiveRatingWeighted: Int {
        if Double(mpg) == 0.0 {
            return 0
        }
        else {
            let x = Double(offensiveRating) * mpgRating
            let y = Int((x * 1).rounded() / 1)
            return y
        }
    }
}
