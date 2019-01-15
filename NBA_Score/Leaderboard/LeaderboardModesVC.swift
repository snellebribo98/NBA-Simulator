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
    
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    let now = Date()
    
    var nowSchedule = Schedule?.self
    var schedule = [Schedule]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        print("Today", now)
        print("Yesterday", yesterday())
        print("Tomorrow", tomorrow())
        
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        view.addSubview(activityIndicator)
        
        activityIndicator.startAnimating()
        UIApplication.shared.beginIgnoringInteractionEvents()
        
        fetchSchedule { (success) -> Void in
            if success
            {
                DispatchQueue.main.async{
                    self.activityIndicator.stopAnimating()
                    UIApplication.shared.endIgnoringInteractionEvents()
                }
            }
        }
    }
    
    func fetchSchedule(completion: @escaping (_ success: Bool) -> Void)
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
                    self.schedule.append(ScheduleDetails)
                    
//                    if schedule.stt != "Final"
//                    {
//                        if schedule.gdte == now
//                        {
//                            print("Schedule vandaag!")
//                        }
//                    }
                }
            }
            completion(true)
        }
        task.resume()
    }
    
    func yesterday() -> Date
    {
        var dateComponents = DateComponents()
        dateComponents.setValue(-1, for: .day)
        
        let now = Date()
        let yesterday = Calendar.current.date(byAdding: dateComponents, to: now)
        
        return yesterday!
    }
    
    func tomorrow() -> Date
    {
        
        var dateComponents = DateComponents()
        dateComponents.setValue(1, for: .day);
        
        let now = Date()
        let tomorrow = Calendar.current.date(byAdding: dateComponents, to: now)
        
        return tomorrow!
    }
}
