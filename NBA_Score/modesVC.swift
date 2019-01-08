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
    override func viewDidLoad()
    {
        fetchTeams()
        fetchPlayers()
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
                    // print(allPlayers)
                }
            }
        }
        task.resume()
    }
    
    
    
}
