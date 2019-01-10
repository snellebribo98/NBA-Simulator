//
//  modesVC.swift
//  NBA_Score
//
//  Created by Brian van de Velde on 28-12-18.
//  Copyright © 2018 Brian van de Velde. All rights reserved.
//

import UIKit

class modesVC: UIViewController
{
    var playerss: Players?
    var idList = [String]()
    var playerStatss = [PlayersStats]()
    var teamDetailss = [Team]()
    var playerList = [Player]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        fetchTeams()
        fetchPlayers()
        
        sleep(3)
        
        fetchPlayerStats(idList: idList)
        fetchSchedule()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let barViewControllers = segue.destination as! UITabBarController
        
        let navTeam = barViewControllers.viewControllers![1] as! UINavigationController
        let destinationTeamViewController = navTeam.topViewController as! TeamTV
        destinationTeamViewController.teamDetailss = self.teamDetailss
        
        let navPlayer = barViewControllers.viewControllers![0] as! UINavigationController
        let destinationPlayerViewController = navPlayer.topViewController as! PlayerTV
        destinationPlayerViewController.playerList = self.playerList
    }
    
    @IBAction func unwindToModes(segue:UIStoryboardSegue) { }
    
    
    
    func fetchTeams()
    {
        let url: URL = URL(string: "http://data.nba.net/10s/prod/v1/2018/teams.json")!
        let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)
        
        let task = defaultSession.dataTask(with: url)
        { (data, response, error) in
            if error != nil
            {
                print("Failed to download Data")
            }
            else
            {
                print(data!)
                let jsonDecoder = JSONDecoder()
                if let data = data, let teamDetails = try? jsonDecoder.decode(teamDetails2.self, from: data)
                {
                    let teams25 = teamDetails.league
                    
                    for team1 in teams25.standard
                    {
//                        if team1.isNBAFranchise == true && self.teamDetailss.count != 0 {
//                            for team in self.teamDetailss {
//                                if team.fullName != team1.fullName {
//                                    self.teamDetailss.append(team1)
//                                }
//                            }
//
//                        }
                        self.teamDetailss.append(team1)
                        
                    }
                    
                    for team2 in teams25.sacramento
                    {
                        self.teamDetailss.append(team2)
                    }
                    
                    for team3 in teams25.vegas
                    {
                        self.teamDetailss.append(team3)
                    }
                    
                    for team4 in teams25.utah
                    {
                        self.teamDetailss.append(team4)
                    }
                    
                    for team5 in teams25.africa
                    {
                        self.teamDetailss.append(team5)
                    }
                    // print(teamDetails)
                }
            }
        }
        task.resume()
       
    }
    
    func fetchPlayers()
    {
        let url: URL = URL(string: "http://data.nba.net/10s/prod/v1/2018/players.json")!
        let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)
        
        let task = defaultSession.dataTask(with: url)
        { (data, response, error) in
            if error != nil
            {
                print("Failed to download Data")
            }
            else
            {
                print(data!)
                let jsonDecoder = JSONDecoder()
                if let data = data, let allPlayers = try? jsonDecoder.decode(Players.self, from: data)
                {
                    self.playerss = allPlayers
                    let test = self.playerss?.league.standard
                    let test2 = self.playerss?.league.africa
                    let test3 = self.playerss?.league.sacramento
                    let test4 = self.playerss?.league.vegas
                    let test5 = self.playerss?.league.utah
                    
                    for player in test!
                    {
                        self.idList.append(player.personId)
                        self.playerList.append(player)
                    }
                    
                    for player in test2!
                    {
                        self.idList.append(player.personId)
                        self.playerList.append(player)
                    }
                    
                    for player in test3!
                    {
                        self.idList.append(player.personId)
                        self.playerList.append(player)
                    }
                    
                    for player in test4!
                    {
                        self.idList.append(player.personId)
                        self.playerList.append(player)
                    }
                    
                    for player in test5!
                    {
                        self.idList.append(player.personId)
                        self.playerList.append(player)
                    }
                }
            }
        }
        task.resume()
    }
    
    func fetchPlayerStats(idList: [String])
    {
        for id in idList
        {
            let url: URL = URL(string: "http://data.nba.net//data/10s/prod/v1/2018/players/\(id)_profile.json")!
            let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)
            
            let task = defaultSession.dataTask(with: url)
            { (data, response, error) in
                if error != nil
                {
                    print("Failed to download Data")
                }
                else
                {
//                    print(data!)
                    let jsonDecoder = JSONDecoder()
                    if let data = data, let PlayerStatsDetails = try? jsonDecoder.decode(PlayersStats.self, from: data)
                    {
                        self.playerStatss.append(PlayerStatsDetails)
                    }
                }
            }
            task.resume()
        }
//        print(playerStatss)
//        print(playerStatss.count)
    }
    
    func fetchSchedule()
    {
        let url: URL = URL(string: "http://data.nba.com/data/10s/v2015/json/mobile_teams/nba/2018/league/00_full_schedule.json")!
        let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)
        
        let task = defaultSession.dataTask(with: url)
        { (data, response, error) in
            if error != nil
            {
                print("Failed to download Data")
            }
            else
            {
                print(data!)
                let jsonDecoder = JSONDecoder()
                if let data = data, let ScheduleDetails = try? jsonDecoder.decode(Schedule.self, from: data)
                {
                    print(ScheduleDetails)
                }
            }
        }
        task.resume()
    }
    
}
