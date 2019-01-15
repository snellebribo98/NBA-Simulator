//
//  TeamTV.swift
//  NBA_Score
//
//  Created by Brian van de Velde on 10-01-19.
//  Copyright © 2019 Brian van de Velde. All rights reserved.
//

import UIKit

class TeamTV: UITableViewController
{
    var teamDetailss = [String: Team]()
    var teamDetail: Team?
    
    @IBOutlet var teamsTableView: UITableView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        print(teamDetailss.count)
        return teamDetailss.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TeamIdentifier") as? TeamCell
        let teamDetail = Array(teamDetailss.values)[indexPath.row]
        if teamDetail.isNBAFranchise == true
        {
            cell?.titleLabel?.text = teamDetail.fullName
        }
        return cell!
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "teamDetailSegue"
        {
            let ip = teamsTableView.indexPathForSelectedRow
            let TDVC = segue.destination as! TeamDetailVC
            TDVC.teamDetails = Array(teamDetailss.values)[ip!.row]
        }
    }
}
