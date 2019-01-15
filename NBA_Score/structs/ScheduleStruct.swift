//
//  ScheduleStruct.swift
//  NBA_Score
//
//  Created by Brian van de Velde on 08-01-19.
//  Copyright © 2019 Brian van de Velde. All rights reserved.
//

import UIKit

struct Schedule: Codable
{
    var lscd: [InternalTest4]
}

struct InternalTest4: Codable
{
    var mscd: Dates
}

struct Dates: Codable
{
    var mon: String
    var g: [Details]
}

struct Details: Codable
{
    var gdte: String
    var etm: String
    var stt: String
    var v: V
    var h: H
    var gdtutc: String
    var utctm: String
}

struct V: Codable
{
    var tid: Int
    var ta: String
    var tn: String
    var tc: String
    var s: String
}

struct H: Codable
{
    var tid: Int
    var ta: String
    var tn: String
    var tc: String
    var s: String
}
