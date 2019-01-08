//
//  ScheduleStruct.swift
//  NBA_Score
//
//  Created by Brian van de Velde on 08-01-19.
//  Copyright © 2019 Brian van de Velde. All rights reserved.
//

import UIKit

//struct Welcome: Codable
//{
//    let lscd: [Lscd]
//}
//
//struct Lscd: Codable
//{
//    let mscd: Mscd
//}
//
//struct Mscd: Codable
//{
//    let mon: String
//    let g: [G]
//}
//
//struct G: Codable
//{
//    let gid, gcode, seri: String
//    let gIs: Int
//    let gdte, htm, vtm, etm: String
//    let an, ac: String
//    let gAs: As
//    let st: String
//    let stt: Stt
//    let bd: Bd
//    let v, h: H
//    let gdtutc: String
//    let utctm: Utctm
//    let ppdst: Ppdst
//    let ptsls: Ptsls?
//    let seq: Int
//    
//    enum CodingKeys: String, CodingKey
//    {
//        case gid, gcode, seri
//        case gIs = "is"
//        case gdte, htm, vtm, etm, an, ac
//        case gAs = "as"
//        case st, stt, bd, v, h, gdtutc, utctm, ppdst, ptsls, seq
//    }
//}
//
//struct Bd: Codable
//{
//    let b: [B]
//}
//
//struct B: Codable
//{
//    let seq: Int
//    let disp: String
//    let scope: Scope
//    let type: TypeEnum
//    let lan: LAN
//}
//
//enum LAN: String, Codable
//{
//    case english = "English"
//}
//
//enum Scope: String, Codable
//{
//    case away = "away"
//    case can = "can"
//    case home = "home"
//    case natl = "natl"
//}
//
//enum TypeEnum: String, Codable
//{
//    case radio = "radio"
//    case tv = "tv"
//}
//
//enum As: String, Codable
//{
//    case al = "AL"
//    case asIN = "IN"
//    case az = "AZ"
//    case bc = "BC"
//    case ca = "CA"
//    case co = "CO"
//    case dc = "DC"
//    case empty = ""
//    case fl = "FL"
//    case ga = "GA"
//    case hi = "HI"
//    case ia = "IA"
//    case il = "IL"
//    case la = "LA"
//    case ma = "MA"
//    case mi = "MI"
//    case mn = "MN"
//    case nc = "NC"
//    case nv = "NV"
//    case ny = "NY"
//    case oh = "OH"
//    case ok = "OK"
//    case on = "ON"
//    case or = "OR"
//    case pa = "PA"
//    case qc = "QC"
//    case tn = "TN"
//    case tx = "TX"
//    case ut = "UT"
//    case wa = "WA"
//    case wi = "WI"
//}
//
//struct H: Codable
//{
//    let tid: Int
//    let re: String
//    let ta: Ta
//    let tn: Tn
//    let tc: Tc
//    let s: String
//}
//
//enum Ta: String, Codable
//{
//    case adl = "ADL"
//    case aso = "ASO"
//    case ast = "AST"
//    case atl = "ATL"
//    case bjd = "BJD"
//    case bkn = "BKN"
//    case bos = "BOS"
//    case cha = "CHA"
//    case chi = "CHI"
//    case cle = "CLE"
//    case dal = "DAL"
//    case den = "DEN"
//    case det = "DET"
//    case fla = "FLA"
//    case gsw = "GSW"
//    case gua = "GUA"
//    case hou = "HOU"
//    case ind = "IND"
//    case lac = "LAC"
//    case lal = "LAL"
//    case mac = "MAC"
//    case mel = "MEL"
//    case mem = "MEM"
//    case mia = "MIA"
//    case mil = "MIL"
//    case min = "MIN"
//    case nop = "NOP"
//    case nyk = "NYK"
//    case nzb = "NZB"
//    case okc = "OKC"
//    case orl = "ORL"
//    case per = "PER"
//    case phi = "PHI"
//    case phx = "PHX"
//    case por = "POR"
//    case sac = "SAC"
//    case sas = "SAS"
//    case sds = "SDS"
//    case syd = "SYD"
//    case tor = "TOR"
//    case uta = "UTA"
//    case was = "WAS"
//}
//
//enum Tc: String, Codable
//{
//    case adelaide = "Adelaide"
//    case allStarTeam1 = "All-Star Team 1"
//    case allStarTeam2 = "All-Star Team 2"
//    case atlanta = "Atlanta"
//    case beijing = "Beijing"
//    case boston = "Boston"
//    case brooklyn = "Brooklyn"
//    case charlotte = "Charlotte"
//    case chicago = "Chicago"
//    case cleveland = "Cleveland"
//    case dallas = "Dallas"
//    case denver = "Denver"
//    case detroit = "Detroit"
//    case flamengo = "Flamengo"
//    case goldenState = "Golden State"
//    case guangzhou = "Guangzhou"
//    case haifa = "Haifa"
//    case houston = "Houston"
//    case indiana = "Indiana"
//    case la = "LA"
//    case losAngeles = "Los Angeles"
//    case melbourne = "Melbourne"
//    case memphis = "Memphis"
//    case miami = "Miami"
//    case milwaukee = "Milwaukee"
//    case minnesota = "Minnesota"
//    case newOrleans = "New Orleans"
//    case newYork = "New York"
//    case newZealand = "New Zealand"
//    case oklahomaCity = "Oklahoma City"
//    case orlando = "Orlando"
//    case perth = "Perth"
//    case philadelphia = "Philadelphia"
//    case phoenix = "Phoenix"
//    case portland = "Portland"
//    case sacramento = "Sacramento"
//    case sanAntonio = "San Antonio"
//    case shanghai = "Shanghai"
//    case sydney = "Sydney"
//    case toronto = "Toronto"
//    case utah = "Utah"
//    case washington = "Washington"
//}
//
//enum Tn: String, Codable
//{
//    case allStarTeam1 = "All-Star Team 1"
//    case allStarTeam2 = "All-Star Team 2"
//    case breakers = "Breakers"
//    case bucks = "Bucks"
//    case bulls = "Bulls"
//    case cavaliers = "Cavaliers"
//    case celtics = "Celtics"
//    case clippers = "Clippers"
//    case ducks = "Ducks"
//    case flamengo = "Flamengo"
//    case grizzlies = "Grizzlies"
//    case hawks = "Hawks"
//    case heat = "Heat"
//    case hornets = "Hornets"
//    case jazz = "Jazz"
//    case kings = "Kings"
//    case knicks = "Knicks"
//    case lakers = "Lakers"
//    case longLions = "Long-Lions"
//    case maccabiHaifa = "Maccabi Haifa"
//    case magic = "Magic"
//    case mavericks = "Mavericks"
//    case nets = "Nets"
//    case nuggets = "Nuggets"
//    case pacers = "Pacers"
//    case pelicans = "Pelicans"
//    case pistons = "Pistons"
//    case raptors = "Raptors"
//    case rockets = "Rockets"
//    case sharks = "Sharks"
//    case spurs = "Spurs"
//    case suns = "Suns"
//    case the36Ers = "36ers"
//    case the76Ers = "76ers"
//    case thunder = "Thunder"
//    case timberwolves = "Timberwolves"
//    case trailBlazers = "Trail Blazers"
//    case united = "United"
//    case warriors = "Warriors"
//    case wildcats = "Wildcats"
//    case wizards = "Wizards"
//}
//
//enum Ppdst: String, Codable
//{
//    case i = "I"
//}
//
//struct Ptsls: Codable
//{
//    let pl: [Pl]
//}
//
//struct Pl: Codable
//{
//    let pid, fn, ln, val: String
//    let tid: Int
//    let ta: Ta
//    let tn: Tn
//    let tc: Tc
//}
//
//enum Stt: String, Codable
//{
//    case sttFinal = "Final"
//    case the1000PmET = "10:00 pm ET"
//    case the100PmET = "1:00 pm ET"
//    case the1030PmET = "10:30 pm ET"
//    case the1200PmET = "12:00 pm ET"
//    case the1230PmET = "12:30 pm ET"
//    case the200PmET = "2:00 pm ET"
//    case the300PmET = "3:00 pm ET"
//    case the330PmET = "3:30 pm ET"
//    case the400PmET = "4:00 pm ET"
//    case the430PmET = "4:30 pm ET"
//    case the500PmET = "5:00 pm ET"
//    case the530PmET = "5:30 pm ET"
//    case the600PmET = "6:00 pm ET"
//    case the700PmET = "7:00 pm ET"
//    case the730PmET = "7:30 pm ET"
//    case the800PmET = "8:00 pm ET"
//    case the830PmET = "8:30 pm ET"
//    case the900PmET = "9:00 pm ET"
//    case the930PmET = "9:30 pm ET"
//}
//
//enum Utctm: String, Codable
//{
//    case the0000 = "00:00"
//    case the0030 = "00:30"
//    case the0100 = "01:00"
//    case the0130 = "01:30"
//    case the0200 = "02:00"
//    case the0230 = "02:30"
//    case the0300 = "03:00"
//    case the0330 = "03:30"
//    case the1130 = "11:30"
//    case the1200 = "12:00"
//    case the1600 = "16:00"
//    case the1630 = "16:30"
//    case the1700 = "17:00"
//    case the1730 = "17:30"
//    case the1800 = "18:00"
//    case the1900 = "19:00"
//    case the1930 = "19:30"
//    case the2000 = "20:00"
//    case the2030 = "20:30"
//    case the2100 = "21:00"
//    case the2200 = "22:00"
//    case the2230 = "22:30"
//    case the2300 = "23:00"
//    case the2330 = "23:30"
//}
