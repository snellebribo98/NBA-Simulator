//
//  RosterTV.swift
//  NBA_Score
//
//  Created by Brian van de Velde on 21/01/2019.
//  Copyright © 2019 Brian van de Velde. All rights reserved.
//

import UIKit

class RosterTV: UITableViewController
{
    var playerList = [Player]()
    
    @IBOutlet var rosterTableView: UITableView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        print(playerList)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return playerList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RosterIdentifier") as? RosterCell
        let playerDetail = playerList[indexPath.row]
        cell?.lastnameLabel?.text = playerDetail.lastName
        cell?.firstnameLabel?.text = playerDetail.firstName
        
        if playerDetail.lastName == ""
        {
            cell?.commaLabel.isHidden = true
            cell?.lastnameLabel.isHidden = true
        }
        else
        {
            cell?.commaLabel.isHidden = false
            cell?.lastnameLabel.isHidden = false
        }
        
        return cell!
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "rosterStatsSegue"
        {
            let ip = rosterTableView.indexPathForSelectedRow
            let PDVC = segue.destination as! PlayerDetailVC
            PDVC.playerList = playerList[ip!.row]
        }
    }
}
