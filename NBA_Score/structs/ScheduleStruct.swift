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
    var gid: String
    var gcode: String
    var seri: String
    var `is`: Int
    var gdte: String
    var htm: String
    var vtm: String
    var etm: String
    var an: String
    var ac: String
    var `as`: String
    var st: String
    var stt: String
    var bd: Bd
    var v: V
    var h: H
    var gdtutc: String
    var utctm: String
    var ppdst: String
    var ptsls: Ptsls
    var seq: Int
    
    enum CodingKeys: String, CodingKey
    {
        case gid
        case gcode
        case seri
        case `is`
        case gdte
        case htm
        case vtm
        case etm
        case an
        case ac
        case `as`
        case st
        case stt
        case bd
        case v
        case h
        case gdtutc
        case utctm
        case ppdst
        case ptsls
        case seq
    }
}

struct Bd: Codable
{
    var b: [B]
}

struct B: Codable
{
    var seq: Int
    var disp: String
    var scope: String
    var type: String
    var lan: String
    
    enum CodingKeys: String, CodingKey
    {
        case seq
        case disp
        case scope
        case type
        case lan
    }
}

struct V: Codable
{
    var tid: Int
    var re: String
    var ta: String
    var tn: String
    var tc: String
    var s: String
    
    enum CodingKeys: String, CodingKey
    {
        case tid
        case re
        case ta
        case tn
        case tc
        case s
    }
}

struct H: Codable
{
    var tid: Int
    var re: String
    var ta: String
    var tn: String
    var tc: String
    var s: String
    
    enum CodingKeys: String, CodingKey
    {
        case tid
        case re
        case ta
        case tn
        case tc
        case s
    }
}

struct Ptsls: Codable
{
    var pl: [Pl]
}

struct Pl: Codable
{
    var pid: String
    var fn: String
    var ln: String
    var val: String
    var tid: String
    var ta: String
    var tn: String
    var tc: String
    
    enum CodingKeys: String, CodingKey
    {
        case pid
        case fn
        case ln
        case val
        case tid
        case ta
        case tn
        case tc
    }
}
