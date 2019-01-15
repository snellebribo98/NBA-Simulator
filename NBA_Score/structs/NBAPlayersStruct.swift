//
//  NBAPlayersStruct.swift
//  NBA_Score
//
//  Created by Brian van de Velde on 08-01-19.
//  Copyright © 2019 Brian van de Velde. All rights reserved.
//

import UIKit

struct Players: Codable
{
    var _internal: InternalTest2
    var league: Standard2
}

struct InternalTest2: Codable
{
    var pubDateTime: String
    var xslt: String
    var eventName: String
}

struct Standard2: Codable
{
    var standard: [Player]
}

struct Player: Codable
{
    var firstName: String
    var lastName: String
    var personId: String
    var teamId: String
    var jersey: String
    var isActive: Bool
    var pos: String
    var heightFeet: String
    var heightInches: String
    var heightMeters: String
    var weightPounds: String
    var weightKilograms: String
    var dateOfBirthUTC: String
    var teams: [Teams]
    var draft: Draft
    var nbaDebutYear: String
    var yearsPro: String
    var collegeName: String
    var lastAffiliation: String
    var country: String
    
    var fullName: [String] {
        return [lastName, firstName]
    }
}

struct Teams: Codable
{
    var teamId: String
    var seasonStart: String
    var seasonEnd: String
}

struct Draft: Codable
{
    var teamId: String
    var pickNum: String
    var roundNum: String
    var seasonYear: String
}
