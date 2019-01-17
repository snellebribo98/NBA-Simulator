//
//  PlayerTV.swift
//  NBA_Score
//
//  Created by Brian van de Velde on 10-01-19.
//  Copyright © 2019 Brian van de Velde. All rights reserved.
//

import UIKit

class PlayerTV: UITableViewController
{
    var playerList: [Player]?
    var playerStatss: [TempPlayersStats]?
    
    @IBOutlet var playerTableView: UITableView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        print("Players:", playerList!.count)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return playerList!.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerIdentifier") as? PlayerCell
        let playerDetail = playerList![indexPath.row]
        cell?.playerLastLabel?.text = playerDetail.lastName
        cell?.playerFirstLabel?.text = playerDetail.firstName
        return cell!
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "playerStatsSegue"
        {
            let ip = playerTableView.indexPathForSelectedRow
            let PDVC = segue.destination as! PlayerDetailVC
//            PDVC.playerList = Array(playerList.values)[ip!.row]
        }
    }
    
}
