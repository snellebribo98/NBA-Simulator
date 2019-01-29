//
//  PlayerTV.swift
//  NBA_Score
//
//  Created by Brian van de Velde on 10-01-19.
//  Copyright © 2019 Brian van de Velde. All rights reserved.
//
//  This class shows all the players their lastname and fullname, alfabetically ordered on the lastname. When a player is pressed the user is directed to the player detail view controller


import UIKit

class PlayerTV: UITableViewController, UISearchBarDelegate {
    /// variables
    var playerList: [Player]?
    var filteredData: [Player]! = []
    
    /// outlets
    @IBOutlet weak var playerTableView: UITableView!
    @IBOutlet weak var searchbarPlayer: UISearchBar!
    
    /// initializes view controller and sorts player lastnames alfabetically
    /// fills empty list with playerlist data to safe if searchbar is used
    override func viewDidLoad() {
        super.viewDidLoad()
        playerList?.sort(by: {$0.lastName < $1.lastName})
        print("Players:", playerList!.count)
        
        playerTableView.dataSource = self
        playerTableView.delegate = self
        searchbarPlayer.delegate = self
        
        filteredData = playerList
    }
    
    /// specifies length of tableview
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playerList!.count
    }
    
    /// shows player lastnames and firstnames in the cells
    /// if there is only a firstname show no comma
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerIdentifier") as? PlayerCell
        let playerDetail = playerList![indexPath.row]
        cell?.playerLastLabel?.text = playerDetail.lastName
        cell?.playerFirstLabel?.text = playerDetail.firstName
        
        if playerDetail.lastName == "" {
            cell?.commaLabel.isHidden = true
            cell?.playerLastLabel.isHidden = true
        }
        else {
            cell?.commaLabel.isHidden = false
            cell?.playerLastLabel.isHidden = false
        }
        
        return cell!
    }

    /// enables searching with the searchbar
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty else {
            playerList = filteredData
            playerTableView.reloadData()
            return
        }
        playerList = filteredData.filter({ (playerList) -> Bool in
            playerList.lastName.lowercased().contains(searchText.lowercased()) || playerList.firstName.lowercased().contains(searchText.lowercased())
        })

        playerTableView.reloadData()
    }
    
    /// enables cancel button and reloads the data if clicked
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchbarPlayer.text = ""
        searchbarPlayer.endEditing(true)
        playerList = filteredData
        playerTableView.reloadData()
        return
    }
    
    /// sends information of the player cell tapped to the next view controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "playerStatsSegue" {
            let ip = playerTableView.indexPathForSelectedRow
            let PDVC = segue.destination as! PlayerDetailVC
            PDVC.playerList = playerList![ip!.row]
        }
    }
    
}
