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
    var stats: Latest?
    var idList = [String]()
    var playerStatss = [PlayersStats]()
    var teamDetailss = [String: Team]()
    var playerList = [Player]()
    
    var Boston = [String]()
    
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        view.addSubview(activityIndicator)
        
        activityIndicator.startAnimating()
        UIApplication.shared.beginIgnoringInteractionEvents()
        
        fetchTeams { (success3) -> Void in
            if success3 {
                self.fetchPlayers { (success) -> Void in
                    if success {
                        
                        print(self.playerList)
                        
                        self.fetchPlayerStats(idList: self.idList) { (success2) -> Void in
                            if success2 {
                                DispatchQueue.main.async {
                                    self.activityIndicator.stopAnimating()
                                    UIApplication.shared.endIgnoringInteractionEvents()
                                    
//                                    print(self.teamDetailss)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "currentSegue"
        {
            let barViewControllers = segue.destination as! UITabBarController
            
            let navTeam = barViewControllers.viewControllers![1] as! UINavigationController
            let destinationTeamViewController = navTeam.topViewController as! TeamTV
            destinationTeamViewController.teamDetailss = self.teamDetailss
            
            let navPlayer = barViewControllers.viewControllers![0] as! UINavigationController
            let destinationPlayerViewController = navPlayer.topViewController as! PlayerTV
            destinationPlayerViewController.playerList = self.playerList
            destinationPlayerViewController.playerStatss = self.playerStatss
        }
    }
    
    @IBAction func unwindToModes(segue:UIStoryboardSegue) { }
    
    func fetchTeams(completion: @escaping (_ success3: Bool) -> Void) {
        let url: URL = URL(string: "http://data.nba.net/10s/prod/v1/2018/teams.json")!
        let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)
        
        let task = defaultSession.dataTask(with: url)
        { (data, response, error) in
            if error != nil{
                print("Failed to download Data")
            }
            else {
                print(data!)
                let jsonDecoder = JSONDecoder()
                if let data = data, let teamDetails = try? jsonDecoder.decode(teamDetails2.self, from: data) {
                    let teams25 = teamDetails.league
                    
                    for team1 in teams25.standard {
                        if team1.isNBAFranchise == true {
                            self.teamDetailss[team1.teamId] = team1
                        }
                    }
                }
            }
            completion(true)
        }
        task.resume()
       
    }
    
    func fetchPlayers(completion: @escaping (_ success: Bool) -> Void) {
        let url: URL = URL(string: "http://data.nba.net/10s/prod/v1/2018/players.json")!
        let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)
        
        let task = defaultSession.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print("Failed to download Data")
            }
            else {
                print(data!)
                let jsonDecoder = JSONDecoder()
                if let data = data, let allPlayers = try? jsonDecoder.decode(Players.self, from: data) {
                    self.playerss = allPlayers
                    let players = self.playerss?.league.standard
                    
                    for player in players! {
                        self.teamDetailss[player.teamId]?.players?.append(player)
                        
                        self.idList.append(player.personId)
                        self.playerList.append(player)
                    }
                }
            }
            completion(true)
        }
        task.resume()
        
    }
    
    func fetchPlayerStats(idList: [String], completion: @escaping (_ success2: Bool) -> Void) {
        for (num, id) in idList.enumerated() {
            let url: URL = URL(string: "http://data.nba.net//data/10s/prod/v1/2018/players/\(id)_profile.json")!
            let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)

            let task = defaultSession.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print("Failed to download Data")
                }
                else {
//                    print(data!)
                    let jsonDecoder = JSONDecoder()
                    if let data = data, let PlayerStatsDetails = try? jsonDecoder.decode(PlayersStats.self, from: data) {
                        self.playerStatss.append(PlayerStatsDetails)
                    }
                }
                
                if num == idList.count - 1 {
                    completion(true)
                }
            }
            task.resume()

        }
    }

//    func fetchPlayerStats()
//    {
//        let url: URL = URL(string: "http://data.nba.net//data/10s/prod/v1/2018/players/203500_profile.json")!
//        let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)
//
//        let task = defaultSession.dataTask(with: url)
//        { (data, response, error) in
//            if error != nil
//            {
//                print("Failed to download Data")
//            }
//            else
//            {
//                print(data!)
//                let jsonDecoder = JSONDecoder()
//                if let data = data, let PlayerStatsDetails = try? jsonDecoder.decode(PlayersStats.self, from: data)
//                {
//                    print(PlayerStatsDetails)
//
//                    let ppg = Double(PlayerStatsDetails.league.standard.stats.latest.ppg)!
//                    let apg = Double(PlayerStatsDetails.league.standard.stats.latest.apg)!
//                    let orpg = Double(PlayerStatsDetails.league.standard.stats.latest.offReb)!
//                    let drpg = Double(PlayerStatsDetails.league.standard.stats.latest.defReb)!
//                    let topg = Double(PlayerStatsDetails.league.standard.stats.latest.topg)!
//                    let spg = Double(PlayerStatsDetails.league.standard.stats.latest.spg)!
//                    let bpg = Double(PlayerStatsDetails.league.standard.stats.latest.bpg)!
//                    let minutes = 100 / Double(PlayerStatsDetails.league.standard.stats.latest.mpg)!
//
//                    let overall = String((ppg * 0.25 + apg * 0.25 + orpg * 0.375 + drpg * 0.125 - topg * 2 + spg * 2 + bpg * 2) * (minutes))
//                    let defensive = String((ppg * 0.125 + apg * 0.125 + orpg * 0.1875 + drpg * 0.25 - topg * 1 + spg * 4 + bpg * 4) * (minutes / 2))
//                    let offensive = String((ppg * 0.5 + apg * 0.5 + orpg * 0.75 + drpg * 0.0625 - topg * 4 + spg * 1 + bpg * 1) * (minutes / 2))
//
//                    print(overall)
//                    print(defensive)
//                    print(offensive)
//
//                    self.playerStatss.append(PlayerStatsDetails)
//                    self.overallRating.append(overall)
//                    self.defensiveRating.append(defensive)
//                    self.offensiveRating.append(offensive)
//                }
//            }
//        }
//        task.resume()
//    }
//
}
