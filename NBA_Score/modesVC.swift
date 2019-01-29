//
//  modesVC.swift
//  NBA_Score
//
//  Created by Brian van de Velde on 28-12-18.
//  Copyright © 2018 Brian van de Velde. All rights reserved.
//
//  This class loads the data, sends it to the right view controller and enables the user to logout.


import UIKit
import Firebase

class modesVC: UIViewController {
    /// variables
    var playerss: Players?
    var stats: PlayerStats?
    var idList = [String: String]()
    var teamDetailss = [String: Team]()
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    /// outlets
    @IBOutlet weak var loadingLabel: UILabel!
    @IBOutlet weak var NBAencyclopediaButton: UIButton!
    @IBOutlet weak var SimulatorButton: UIButton!
    @IBOutlet weak var RefreshDataButton: UIButton!
    @IBOutlet weak var LoginButton: UIButton!
    
    /// unwind destination
    @IBAction func unwindToModes(segue:UIStoryboardSegue) { }
    
    /// empty the dictionaries with all the data
    /// if both dictionaries are empty reloads the data and shows loading label
    @IBAction func RefreshButtonTapped(_ sender: Any) {
        idList.removeAll()
        teamDetailss.removeAll()
        
        loadingLabel.isHidden = false
        loadingLabel.text = "Loading Data"

        startLoading()
        
        if idList.isEmpty && teamDetailss.isEmpty {
            fetchData()
        }
    }
    
    /// initializes view controller and calls the startloading and fetchdata function
    override func viewDidLoad() {
        super.viewDidLoad()
        loadingLabel.text = "Loading Data"
        
        startLoading()
        
        fetchData()
    }
    
    /// loads apis in a particular order
    /// first the team is needed
    /// after that the players can be added to each team
    /// after that the stats of each player can be added to the right player
    func fetchData() {
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
    
    /// fetches team data only if the team is an actual NBA franchise and regular season team
    /// loads it as a dictionary with the teamID as the key and team information as the value
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
    
    /// fetches players and places them in the right team according to teamID
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
                        if self.teamDetailss[player.teamId]?.players == nil {
                            self.teamDetailss[player.teamId]?.players = [Player]()
                        }
                        self.teamDetailss[player.teamId]?.players?.append(player)
                        self.idList[player.personId] = player.teamId
                    }
                }
            }
            completion(true)
        }
        task.resume()
    }
    
    /// fetches latest player stats to the right player with the help of playerID
    /// knows the completion is done if the number of playerID's is the same as the loaded player stats
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
    
    /// starts the activity indicator which stops user interaction when loading apis is started
    func startLoading() {
        activityIndicator.style = .whiteLarge
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 125, height: 125)
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        view.addSubview(activityIndicator)
        
        activityIndicator.startAnimating()
        UIApplication.shared.beginIgnoringInteractionEvents()
    }
    
    /// stops the activity indicator if all apis are fully loaded and now user can interact again
    func stopLoading() {
        self.activityIndicator.stopAnimating()
        UIApplication.shared.endIgnoringInteractionEvents()
    }
    
    /// handles the logout of a user with the help of firebase
    @IBAction func handleLogout(_ target: UIButton) {
        try! Auth.auth().signOut()
        self.dismiss(animated: false, completion: nil)
    }
    
    /// sends the data to the right view controllers
    /// the team tableview gets the team dictionary
    /// the player tableview gets the player list
    /// the simulator view controller gets the team dictionary
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "currentSegue" {
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
        else if segue.identifier == "simulatorSegue" {
            let SRVC = segue.destination as! SimulatorVC
            SRVC.teamDetailss = self.teamDetailss
        }
    }
}
