//
//  test.swift
//  NBA_Score
//
//  Created by Brian van de Velde on 08-01-19.
//  Copyright © 2019 Brian van de Velde. All rights reserved.
//

import UIKit

struct teamDetails2: Codable
{
    var _internal: InternalTest
    var league: Standard
}

struct InternalTest: Codable {
    var pubDateTime: String
    var xslt: String
    var eventName: String
}

struct Standard: Codable {
    var standard: [Team]}

struct Team: Codable {
    var isNBAFranchise: Bool
    var isAllStar: Bool
    var city: String
    var altCityName: String
    var fullName: String
    var tricode: String
    var teamId: String
    var nickname: String
    var urlName: String
    var confName: String
    var divName: String
    
    enum CodingKeys: String, CodingKey {
        case isNBAFranchise
        case isAllStar
        case city
        case altCityName
        case fullName
        case tricode
        case teamId
        case nickname
        case urlName
        case confName
        case divName
    }
}
