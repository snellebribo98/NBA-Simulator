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
    var teamDetailss: [Team]?
    var currentTeamDetailss: [Team]?
    
    @IBOutlet weak var searchBarTeam: UISearchBar!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        Copy()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        print(teamDetailss!.count)
        return teamDetailss!.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TeamIdentifier") as? TeamCell
        let teamDetail = teamDetailss![indexPath.row]
        if teamDetail.isNBAFranchise == true
        {
            cell?.titleLabel?.text = teamDetail.fullName
        }
        return cell!
    }
    
    private func SearchBar ()
    {
        searchBarTeam.delegate = self
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String)
    {
        guard !searchText.isEmpty else
        {
            teamDetailss = currentTeamDetailss
            tableView.reloadData()
            return
        }
//        teamDetailss = currentTeamDetailss?.filter({ (ToDo) -> Bool in
//            Team.fullName.lowercased().contains(searchText.lowercased())
//        })
        tableView.reloadData()
    }
    
    func Copy()
    {
        currentTeamDetailss = teamDetailss
    }
}
