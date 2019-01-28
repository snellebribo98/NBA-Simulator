//
//  TeamTV.swift
//  NBA_Score
//
//  Created by Brian van de Velde on 10-01-19.
//  Copyright © 2019 Brian van de Velde. All rights reserved.
//

import UIKit

class TeamTV: UITableViewController, UISearchBarDelegate
{
    var teamDetail: Team?
    var teamDetailss = [Team]()
    var filteredData: [Team]! = []
    
    @IBOutlet weak var searchbarTeam: UISearchBar!
    @IBOutlet var teamsTableView: UITableView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        teamDetailss.sort(by: {$0.fullName < $1.fullName})
        
        teamsTableView.dataSource = self
        teamsTableView.delegate = self
        searchbarTeam.delegate = self
        Copy()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        print(teamDetailss.count)
        return teamDetailss.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TeamIdentifier") as? TeamCell
        let teamDetail = teamDetailss[indexPath.row]
        
        if teamDetail.isNBAFranchise == true
        {
            cell?.titleLabel?.text = teamDetail.fullName
        }
        return cell!
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String)
    {
        guard !searchText.isEmpty else
        {
            teamDetailss = filteredData
            teamsTableView.reloadData()
            return
        }
        teamDetailss = filteredData.filter({ (teamDetailss) -> Bool in
            teamDetailss.fullName.lowercased().contains(searchText.lowercased())
        })
        teamsTableView.reloadData()
    }
    
    func Copy()
    {
        filteredData = teamDetailss
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "teamDetailSegue"
        {
            let ip = teamsTableView.indexPathForSelectedRow
            let TDVC = segue.destination as! TeamDetailVC
            TDVC.teamDetails = teamDetailss[ip!.row]
        }
    }
}
