//
//  RosterTV.swift
//  NBA_Score
//
//  Created by Brian van de Velde on 21/01/2019.
//  Copyright © 2019 Brian van de Velde. All rights reserved.
//
//  This class show the roster of the team selected in the previous tableview controller. The players are alfabetically ordered bassed on their last name. When a player is pressed the user is directed to the player detail view controller


import UIKit

class RosterTV: UITableViewController, UISearchBarDelegate {
    /// variables
    var playerList = [Player]()
    var filteredData: [Player]! = []

    /// outlets
    @IBOutlet var rosterTableView: UITableView!
    @IBOutlet weak var rosterSearchbar: UISearchBar!
    
    /// initializes view controller and sorts player lastnames alfabetically
    /// fills empty list with playerlist data to safe if searchbar is used
    override func viewDidLoad() {
        super.viewDidLoad()
        playerList.sort(by: {$0.lastName < $1.lastName})
        print(playerList)
        
        rosterTableView.dataSource = self
        rosterTableView.delegate = self
        rosterSearchbar.delegate = self
        
        filteredData = playerList
    }
    
    /// specifies length of tableview
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playerList.count
    }
    
    /// shows player lastnames and firstnames in the cells
    /// if there is only a firstname show no comma
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RosterIdentifier") as? RosterCell
        let playerDetail = playerList[indexPath.row]
        cell?.lastnameLabel?.text = playerDetail.lastName
        cell?.firstnameLabel?.text = playerDetail.firstName
        
        if playerDetail.lastName == "" {
            cell?.commaLabel.isHidden = true
            cell?.lastnameLabel.isHidden = true
        }
        else {
            cell?.commaLabel.isHidden = false
            cell?.lastnameLabel.isHidden = false
        }
        
        return cell!
    }
    
    /// enables searching with the searchbar
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty else {
            playerList = filteredData
            rosterTableView.reloadData()
            return
        }
        playerList = filteredData.filter({ (playerList) -> Bool in
            playerList.lastName.lowercased().contains(searchText.lowercased()) || playerList.firstName.lowercased().contains(searchText.lowercased())
        })
        
        rosterTableView.reloadData()
    }
    
    /// enables cancel button and reloads the data if clicked
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        rosterSearchbar.text = ""
        rosterSearchbar.endEditing(true)
        playerList = filteredData
        rosterTableView.reloadData()
        return
    }
    
    /// sends information of the player cell tapped to the next view controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "rosterStatsSegue" {
            let ip = rosterTableView.indexPathForSelectedRow
            let PDVC = segue.destination as! PlayerDetailVC
            PDVC.playerList = playerList[ip!.row]
        }
    }
}
