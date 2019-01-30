//
//  TeamTV.swift
//  NBA_Score
//
//  Created by Brian van de Velde on 10-01-19.
//  Copyright © 2019 Brian van de Velde. All rights reserved.
//
//  This class shows all the teams, alfabetically ordered. When a team is pressed the user is directed to the team detail view controller


import UIKit


class TeamTV: UITableViewController, UISearchBarDelegate {
    /// variables
    var teamDetail: Team?
    var teamDetailss = [Team]()
    var filteredData: [Team]! = []
    
    /// outlets
    @IBOutlet weak var searchbarTeam: UISearchBar!
    @IBOutlet var teamsTableView: UITableView!
    
    /// initializes view controller and sorts teamdetails alfabetically
    /// fills empty list with teamdetails data to safe if searchbar is used
    override func viewDidLoad() {
        super.viewDidLoad()
        teamDetailss.sort(by: {$0.fullName < $1.fullName})
        
        teamsTableView.dataSource = self
        teamsTableView.delegate = self
        searchbarTeam.delegate = self
        filteredData = teamDetailss
    }
    
    /// specifies length of tableview
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teamDetailss.count
    }
    
    /// shows team names in the cells
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TeamIdentifier") as? TeamCell
        let teamDetail = teamDetailss[indexPath.row]
        
        if teamDetail.isNBAFranchise == true {
            cell?.titleLabel?.text = teamDetail.fullName
        }
        return cell!
    }
    
    /// enables searching with the searchbar
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty else {
            teamDetailss = filteredData
            teamsTableView.reloadData()
            return
        }
        teamDetailss = filteredData.filter({ (teamDetailss) -> Bool in
            teamDetailss.fullName.lowercased().contains(searchText.lowercased())
        })
        teamsTableView.reloadData()
    }
    
    /// enables cancel button and reloads the data if clicked
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchbarTeam.text = ""
        searchbarTeam.endEditing(true)
        teamDetailss = filteredData
        teamsTableView.reloadData()
        return
    }
    
    /// sends information of the team cell tapped to the next view controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "teamDetailSegue"
        {
            let ip = teamsTableView.indexPathForSelectedRow
            let TDVC = segue.destination as! TeamDetailVC
            TDVC.teamDetails = teamDetailss[ip!.row]
        }
    }
}
