//
//  TeamDetailVC.swift
//  NBA_Score
//
//  Created by Brian van de Velde on 28-12-18.
//  Copyright © 2018 Brian van de Velde. All rights reserved.
//
//  This class shows all the specific details of the team that was tapped in the tableview.


import UIKit


class TeamDetailVC: UIViewController {
    /// outlets
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var tricodeLabel: UILabel!
    @IBOutlet weak var conferanceLabel: UILabel!
    @IBOutlet weak var divisionLabel: UILabel!
    @IBOutlet weak var TeamImage: UIImageView!
    @IBOutlet weak var OverallLabel: UILabel!
    @IBOutlet weak var DefensiveLabel: UILabel!
    @IBOutlet weak var OffensiveLabel: UILabel!

    /// variables
    var teamDetails: Team?
    var TeamChosen: String?
    
    /// initializes view controller and calls the update text function
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    /// updates the text in the view controller
    func updateUI() {
        TeamChosen = teamDetails?.fullName
        teamNameLabel.text = teamDetails?.fullName
        cityNameLabel.text = teamDetails?.city
        nicknameLabel.text = teamDetails?.nickname
        tricodeLabel.text = teamDetails?.tricode
        conferanceLabel.text = teamDetails?.confName
        divisionLabel.text = teamDetails?.divName
        
        OverallLabel.text = String((teamDetails?.overalRating)!)
        DefensiveLabel.text = String((teamDetails?.defensiveRating)!)
        OffensiveLabel.text = String((teamDetails?.offensiveRating)!)

        teamLayout()
    }
    
    /// depending on which team is pressed it shows its layout and logo
    func teamLayout() {
        if TeamChosen == "Boston Celtics" {
            self.view.backgroundColor = UIColor.init(red:0.25, green:0.78, blue:0.49, alpha:1.0)
            TeamImage.image = UIImage(named:"celtics.png")
            self.view.addSubview(TeamImage)
        }
        else if TeamChosen == "Brooklyn Nets" {
            self.view.backgroundColor = UIColor.init(red:0.78, green:0.80, blue:0.79, alpha:1.0)
            TeamImage.image = UIImage(named:"nets.png")
            self.view.addSubview(TeamImage)
        }
        else if TeamChosen == "New York Knicks" {
            self.view.backgroundColor = UIColor.init(red:0.15, green:0.25, blue:0.77, alpha:1.0)
            TeamImage.image = UIImage(named:"knicks.png")
            self.view.addSubview(TeamImage)
        }
        else if TeamChosen == "Philadelphia 76ers" {
            self.view.backgroundColor = UIColor.init(red:0.94, green:0.05, blue:0.27, alpha:1.0)
            TeamImage.image = UIImage(named:"philly.png")
            self.view.addSubview(TeamImage)
        }
        else if TeamChosen == "Toronto Raptors" {
            self.view.backgroundColor = UIColor.init(red:0.87, green:0.07, blue:0.26, alpha:1.0)
            TeamImage.image = UIImage(named:"toronto.png")
            self.view.addSubview(TeamImage)
        }
        else if TeamChosen == "Chicago Bulls" {
            self.view.backgroundColor = UIColor.init(red:0.98, green:0.09, blue:0.09, alpha:1.0)
            TeamImage.image = UIImage(named:"bulls.png")
            self.view.addSubview(TeamImage)
        }
        else if TeamChosen == "Cleveland Cavaliers" {
            self.view.backgroundColor = UIColor.init(red:0.55, green:0.00, blue:0.00, alpha:1.0)
            TeamImage.image = UIImage(named:"cavs.png")
            self.view.addSubview(TeamImage)
        }
        else if TeamChosen == "Detroit Pistons" {
            self.view.backgroundColor = UIColor.init(red:0.98, green:0.09, blue:0.09, alpha:1.0)
            TeamImage.image = UIImage(named:"pistons.png")
            self.view.addSubview(TeamImage)
        }
        else if TeamChosen == "Indiana Pacers" {
            self.view.backgroundColor = UIColor.init(red:0.94, green:0.94, blue:0.12, alpha:1.0)
            TeamImage.image = UIImage(named:"pacers.png")
            self.view.addSubview(TeamImage)
        }
        else if TeamChosen == "Milwaukee Bucks" {
            self.view.backgroundColor = UIColor.init(red:0.13, green:0.54, blue:0.13, alpha:1.0)
            TeamImage.image = UIImage(named:"bucks.png")
            self.view.addSubview(TeamImage)
        }
        else if TeamChosen == "Atlanta Hawks" {
            self.view.backgroundColor = UIColor.init(red:0.98, green:0.09, blue:0.09, alpha:1.0)
            TeamImage.image = UIImage(named:"hawks.png")
            self.view.addSubview(TeamImage)
        }
        else if TeamChosen == "Charlotte Hornets" {
            self.view.backgroundColor = UIColor.init(red:0.07, green:0.11, blue:0.85, alpha:1.0)
            TeamImage.image = UIImage(named:"hornets.png")
            self.view.addSubview(TeamImage)
        }
        else if TeamChosen == "Miami Heat" {
            self.view.backgroundColor = UIColor.init(red:0.69, green:0.15, blue:0.31, alpha:1.0)
            TeamImage.image = UIImage(named:"heat.png")
            self.view.addSubview(TeamImage)
        }
        else if TeamChosen == "Orlando Magic" {
            self.view.backgroundColor = UIColor.init(red:0.13, green:0.06, blue:0.99, alpha:1.0)
            TeamImage.image = UIImage(named:"magic.png")
            self.view.addSubview(TeamImage)
        }
        else if TeamChosen == "Washington Wizards" {
            self.view.backgroundColor = UIColor.init(red:0.94, green:0.07, blue:0.23, alpha:1.0)
            TeamImage.image = UIImage(named:"wizards.png")
            self.view.addSubview(TeamImage)
        }
        else if TeamChosen == "Golden State Warriors" {
            self.view.backgroundColor = UIColor.init(red:0.98, green:0.88, blue:0.04, alpha:1.0)
            TeamImage.image = UIImage(named:"warriors.png")
            self.view.addSubview(TeamImage)
        }
        else if TeamChosen == "LA Clippers" {
            self.view.backgroundColor = UIColor.init(red:0.98, green:0.04, blue:0.15, alpha:1.0)
            TeamImage.image = UIImage(named:"clippers.png")
            self.view.addSubview(TeamImage)
        }
        else if TeamChosen == "Los Angeles Lakers" {
            self.view.backgroundColor = UIColor.init(red:0.98, green:0.88, blue:0.04, alpha:1.0)
            TeamImage.image = UIImage(named:"lakers.png")
            self.view.addSubview(TeamImage)
        }
        else if TeamChosen == "Phoenix Suns" {
            self.view.backgroundColor = UIColor.init(red:0.96, green:0.52, blue:0.11, alpha:1.0)
            TeamImage.image = UIImage(named:"suns.png")
            self.view.addSubview(TeamImage)
        }
        else if TeamChosen == "Sacramento Kings" {
            self.view.backgroundColor = UIColor.init(red:0.64, green:0.11, blue:0.96, alpha:1.0)
            TeamImage.image = UIImage(named:"kings.png")
            self.view.addSubview(TeamImage)
        }
        else if TeamChosen == "Dallas Mavericks" {
            self.view.backgroundColor = UIColor.init(red:0.11, green:0.60, blue:0.96, alpha:1.0)
            TeamImage.image = UIImage(named:"dallas.png")
            self.view.addSubview(TeamImage)
        }
        else if TeamChosen == "Houston Rockets" {
            self.view.backgroundColor = UIColor.init(red:0.93, green:0.75, blue:0.75, alpha:1.0)
            TeamImage.image = UIImage(named:"rockets.png")
            self.view.addSubview(TeamImage)
        }
        else if TeamChosen == "Memphis Grizzlies" {
            self.view.backgroundColor = UIColor.init(red:0.19, green:0.40, blue:0.82, alpha:1.0)
            TeamImage.image = UIImage(named:"memphis.png")
            self.view.addSubview(TeamImage)
        }
        else if TeamChosen == "New Orleans Pelicans" {
            self.view.backgroundColor = UIColor.init(red:0.98, green:0.04, blue:0.15, alpha:1.0)
            TeamImage.image = UIImage(named:"pelicans.png")
            self.view.addSubview(TeamImage)
        }
        else if TeamChosen == "San Antonio Spurs" {
            self.view.backgroundColor = UIColor.init(red:0.58, green:0.59, blue:0.61, alpha:1.0)
            TeamImage.image = UIImage(named:"spurs.png")
            self.view.addSubview(TeamImage)
        }
        else if TeamChosen == "Denver Nuggets" {
            self.view.backgroundColor = UIColor.init(red:0.93, green:0.93, blue:0.09, alpha:1.0)
            TeamImage.image = UIImage(named:"nuggets.png")
            self.view.addSubview(TeamImage)
        }
        else if TeamChosen == "Minnesota Timberwolves" {
            self.view.backgroundColor = UIColor.init(red:0.04, green:0.15, blue:0.68, alpha:1.0)
            TeamImage.image = UIImage(named:"timberwolves.png")
            self.view.addSubview(TeamImage)
        }
        else if TeamChosen == "Oklahoma City Thunder" {
            self.view.backgroundColor = UIColor.init(red:0.20, green:0.69, blue:0.97, alpha:1.0)
            TeamImage.image = UIImage(named:"thunder.png")
            self.view.addSubview(TeamImage)
        }
        else if TeamChosen == "Portland Trail Blazers" {
            self.view.backgroundColor = UIColor.init(red:0.81, green:0.02, blue:0.22, alpha:1.0)
            TeamImage.image = UIImage(named:"blazers.png")
            self.view.addSubview(TeamImage)
        }
        else if TeamChosen == "Utah Jazz" {
            self.view.backgroundColor = UIColor.init(red:0.05, green:0.15, blue:0.61, alpha:1.0)
            TeamImage.image = UIImage(named:"jazz.png")
            self.view.addSubview(TeamImage)
        }
    }
    
    /// sends the roster information of the team pressed to the next tableview
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "rosterSegue" {
            let RVC = segue.destination as! RosterTV
            RVC.playerList = (teamDetails?.players)!
        }
    }
}
