//
//  RosterTV.swift
//  NBA_Score
//
//  Created by Brian van de Velde on 21/01/2019.
//  Copyright © 2019 Brian van de Velde. All rights reserved.
//

import UIKit

class RosterTV: UITableViewController, UISearchBarDelegate
{
    var playerList = [Player]()
    var filteredData: [Player]! = []

    
    @IBOutlet var rosterTableView: UITableView!
    @IBOutlet weak var rosterSearchbar: UISearchBar!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        playerList.sort(by: {$0.lastName < $1.lastName})
        print(playerList)
        
        rosterTableView.dataSource = self
        rosterTableView.delegate = self
        rosterSearchbar.delegate = self
        
        Copy()
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
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String)
    {
        guard !searchText.isEmpty else
        {
            playerList = filteredData
            rosterTableView.reloadData()
            return
        }
        playerList = filteredData.filter({ (playerList) -> Bool in
            playerList.lastName.lowercased().contains(searchText.lowercased()) || playerList.firstName.lowercased().contains(searchText.lowercased())
        })
        
        rosterTableView.reloadData()
    }
    
    func Copy()
    {
        filteredData = playerList
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
