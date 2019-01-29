//
//  modesVC.swift
//  NBA_Score
//
//  Created by Brian van de Velde on 28-12-18.
//  Copyright © 2018 Brian van de Velde. All rights reserved.
//

import UIKit
import Firebase

class modesVC: UIViewController
{
    var playerss: Players?
    var stats: PlayerStats?
    var idList = [String: String]()
    var teamDetailss = [String: Team]()

    @IBOutlet weak var loadingLabel: UILabel!
    
    @IBOutlet weak var NBAencyclopediaButton: UIButton!
    @IBOutlet weak var SimulatorButton: UIButton!
    @IBOutlet weak var RefreshDataButton: UIButton!
    @IBOutlet weak var LoginButton: UIButton!
    
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    @IBAction func unwindToModes(segue:UIStoryboardSegue) { }
    
    @IBAction func RefreshButtonTapped(_ sender: Any)
    {
        idList.removeAll()
        teamDetailss.removeAll()
        
        loadingLabel.isHidden = false
        loadingLabel.text = "Loading Data"

        startLoading()
        
        if idList.isEmpty && teamDetailss.isEmpty
        {
            fetchData()
        }
    }
        
    override func viewDidLoad()
    {
        super.viewDidLoad()
        loadingLabel.text = "Loading Data"
        
//        print("Username: ", Auth.auth().currentUser?.displayName as Any)
        
        startLoading()
        
        fetchData()
    }
    
    func fetchData()
    {
        fetchTeams { (success3) -> Void in
            if success3 {
                print("Teams: \(self.teamDetailss.count)")
                self.fetchPlayers { (success) -> Void in
                    if success {
                        self.fetchPlayerStats(idList: self.idList) { (success2) -> Void in
                            if success2 {
                                DispatchQueue.main.async {
                                    self.stopLoading()
                                    self.loadingLabel.isHidden = true
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
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
    
    func Loading() {
        let alert = UIAlertController(title: "Loading Data!", message: "", preferredStyle: .alert)
        self.present(alert, animated: true, completion: nil)
        
        let subview = (alert.view.subviews.first?.subviews.first?.subviews.first!)! as UIView
        subview.layer.cornerRadius = 1
        subview.backgroundColor = UIColor(red: (0/255.0), green: (255/255.0), blue: (0/255.0), alpha: 1.0)
        
        Timer.scheduledTimer(withTimeInterval: 3, repeats: false, block: { _ in alert.dismiss(animated: true, completion: nil)} )
    }
    
    func startLoading()
    {
        activityIndicator.style = .whiteLarge
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 125, height: 125)
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        view.addSubview(activityIndicator)
        
        activityIndicator.startAnimating()
        UIApplication.shared.beginIgnoringInteractionEvents()
    }
    
    func stopLoading()
    {
        self.activityIndicator.stopAnimating()
        UIApplication.shared.endIgnoringInteractionEvents()
    }
    
    @IBAction func handleLogout(_ target: UIButton) {
        try! Auth.auth().signOut()
        self.dismiss(animated: false, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "currentSegue"
        {
            let barViewControllers = segue.destination as! UITabBarController
            
            let teamArray = Array(teamDetailss.values.map{ $0 })
            let navTeam = barViewControllers.viewControllers![1] as! UINavigationController
            let destinationTeamViewController = navTeam.topViewController as! TeamTV
            destinationTeamViewController.teamDetailss = teamArray
            
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
}
