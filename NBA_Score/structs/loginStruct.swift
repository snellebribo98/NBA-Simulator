//
//  loginStruct.swift
//  NBA_Score
//
//  Created by Brian van de Velde on 17/01/2019.
//  Copyright © 2019 Brian van de Velde. All rights reserved.
//

import UIKit

struct Login: Codable
{
    var id: Int
    var email: String
    var password: String
    var firstname: String
    var lastname: String
    var username: String
    var country: String
    var NBA_Team: String
}
