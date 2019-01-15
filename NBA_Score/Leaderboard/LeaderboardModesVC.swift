//
//  LeaderboardModesVC.swift
//  NBA_Score
//
//  Created by Brian van de Velde on 10-01-19.
//  Copyright © 2019 Brian van de Velde. All rights reserved.
//

import UIKit

class LeaderboardModesVC: UIViewController
{
    @IBAction func unwindToLeaderboardModes(segue:UIStoryboardSegue) { }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        fetchSchedule()
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
