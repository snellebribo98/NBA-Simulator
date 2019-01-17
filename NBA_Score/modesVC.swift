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
    var stats: PlayerStats?
    var idList = [String: String]()
    var teamDetailss = [String: Team]()
    
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        activityIndicator.style = .whiteLarge
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 125, height: 125)
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        view.addSubview(activityIndicator)
        
        activityIndicator.startAnimating()
        UIApplication.shared.beginIgnoringInteractionEvents()
        
        fetchTeams { (success3) -> Void in
            if success3 {
                print("Teams: \(self.teamDetailss.count)")
                self.fetchPlayers { (success) -> Void in
                    if success {
//                        print(self.playerList)
                        
                        self.fetchPlayerStats(idList: self.idList) { (success2) -> Void in
                            if success2 {
                                DispatchQueue.main.async {
                                    self.activityIndicator.stopAnimating()
                                    UIApplication.shared.endIgnoringInteractionEvents()
                                    
//                                    print(self.teamDetailss)
                                }
//                                print(self.playerStatss)
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
            
            var playerList = [Player]()
            for (_,team) in teamDetailss {
                playerList.append(contentsOf: team.players!)
            }
            destinationPlayerViewController.playerList = playerList
        }
        else if segue.identifier == "simulatorSegue"
        {
            let SRVC = segue.destination as! SimulatorVC
            SRVC.teamDetailss = self.teamDetailss
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
                        // Check id team has a list for players
                        if self.teamDetailss[player.teamId]?.players == nil {
                            // Create an empty list for players
                            self.teamDetailss[player.teamId]?.players = [Player]()
                        }
                        // Append player to list in team
                        self.teamDetailss[player.teamId]?.players?.append(player)
                        
                        self.idList[player.personId] = player.teamId
                    }
                }
            }
            completion(true)
//            print(self.idList)
        }
        task.resume()
        
    }
    
    func fetchPlayerStats(idList: [String: String], completion: @escaping (_ success2: Bool) -> Void) {
        var i: Int = 0
        for (playerId, teamId) in idList {
            let url: URL = URL(string: "http://data.nba.net//data/10s/prod/v1/2018/players/\(playerId)_profile.json")!
            let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)

            let task = defaultSession.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print("Failed to download Data")
                }
                else {
//                    print(data!)
                    let jsonDecoder = JSONDecoder()
                    if let data = data, let playerStatsDetails = try? jsonDecoder.decode(TempPlayersStats.self, from: data) {
                        let team = self.teamDetailss[teamId]
                        if team != nil
                        {
                            self.teamDetailss[teamId]!.players![team!.playerIndexWith(id: playerId)].stats = playerStatsDetails.league.standard.stats.latest
                        }
                    }
                }
                i += 1
                
                if i == idList.count - 1 {
                    completion(true)
                }
            }
            task.resume()

        }
    }
}
