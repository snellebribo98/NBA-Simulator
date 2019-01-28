//
//  PlayerTV.swift
//  NBA_Score
//
//  Created by Brian van de Velde on 10-01-19.
//  Copyright © 2019 Brian van de Velde. All rights reserved.
//

import UIKit

class PlayerTV: UITableViewController, UISearchBarDelegate
{
    var playerList: [Player]?
    var filteredData: [Player]! = []
    
    @IBOutlet var playerTableView: UITableView!
    @IBOutlet var searchbarPlayer: UISearchBar!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        playerList?.sort(by: {$0.lastName < $1.lastName})
        print("Players:", playerList!.count)
        
        playerTableView.dataSource = self
        playerTableView.delegate = self
        searchbarPlayer.delegate = self
        
        Copy()
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
        
        if playerDetail.lastName == ""
        {
            cell?.commaLabel.isHidden = true
            cell?.playerLastLabel.isHidden = true
        }
        else
        {
            cell?.commaLabel.isHidden = false
            cell?.playerLastLabel.isHidden = false
        }
        
        return cell!
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String)
    {
        guard !searchText.isEmpty else
        {
            playerList = filteredData
            playerTableView.reloadData()
            return
        }
        playerList = filteredData.filter({ (playerList) -> Bool in
            playerList.lastName.lowercased().contains(searchText.lowercased()) || playerList.firstName.lowercased().contains(searchText.lowercased())
        })

        playerTableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchbarPlayer.text = ""
        playerTableView.reloadData()
    }
    
    func Copy()
    {
        filteredData = playerList
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "playerStatsSegue"
        {
            let ip = playerTableView.indexPathForSelectedRow
            let PDVC = segue.destination as! PlayerDetailVC
            PDVC.playerList = playerList![ip!.row]
        }
    }
    
}
