//
//  SimulatorResultVC.swift
//  NBA_Score
//
//  Created by Brian van de Velde on 14-01-19.
//  Copyright © 2019 Brian van de Velde. All rights reserved.
//
//  This class shows the simulated result of the game chosen by the user.


import UIKit


class SimulatorResultVC: UIViewController {
    /// outlets
    @IBOutlet weak var homeImage: UIImageView!
    @IBOutlet weak var visitingImage: UIImageView!
    @IBOutlet weak var homeTeamLabel: UILabel!
    @IBOutlet weak var visitingTeamLabel: UILabel!
    @IBOutlet weak var homeScoreLabel: UILabel!
    @IBOutlet weak var awayScoreLabel: UILabel!
    
    /// variables
    var TeamChosen: String = ""
    var awayTeamChosen: String = ""
    var homeScore: Int = 0
    var visitingScore: Int = 0
    
    /// initializes view controller and assigns the values of the score to the right label
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeScoreLabel.text = String(homeScore)
        awayScoreLabel.text = String(visitingScore)
        
        homeTeamLabel.text = TeamChosen
        visitingTeamLabel.text = awayTeamChosen
        
        teams()
    }
    
    /// shows correct image to the right imageview
    func teams() {
        if TeamChosen == "Boston Celtics" {
            homeImage.image = UIImage(named:"celtics.png")
            self.view.addSubview(homeImage)
        }
        else if TeamChosen == "Brooklyn Nets" {
            homeImage.image = UIImage(named:"nets.png")
            self.view.addSubview(homeImage)
        }
        else if TeamChosen == "New York Knicks" {
            homeImage.image = UIImage(named:"knicks.png")
            self.view.addSubview(homeImage)
        }
        else if TeamChosen == "Philadelphia 76ers" {
            homeImage.image = UIImage(named:"philly.png")
            self.view.addSubview(homeImage)
        }
        else if TeamChosen == "Toronto Raptors" {
            homeImage.image = UIImage(named:"toronto.png")
            self.view.addSubview(homeImage)
        }
        else if TeamChosen == "Chicago Bulls" {
            homeImage.image = UIImage(named:"bulls.png")
            self.view.addSubview(homeImage)
        }
        else if TeamChosen == "Cleveland Cavaliers" {
            homeImage.image = UIImage(named:"cavs.png")
            self.view.addSubview(homeImage)
        }
        else if TeamChosen == "Detroit Pistons" {
            homeImage.image = UIImage(named:"pistons.png")
            self.view.addSubview(homeImage)
        }
        else if TeamChosen == "Indiana Pacers" {
            homeImage.image = UIImage(named:"pacers.png")
            self.view.addSubview(homeImage)
        }
        else if TeamChosen == "Milwaukee Bucks" {
            homeImage.image = UIImage(named:"bucks.png")
            self.view.addSubview(homeImage)
        }
        else if TeamChosen == "Atlanta Hawks" {
            homeImage.image = UIImage(named:"hawks.png")
            self.view.addSubview(homeImage)
        }
        else if TeamChosen == "Charlotte Hornets" {
            homeImage.image = UIImage(named:"hornets.png")
            self.view.addSubview(homeImage)
        }
        else if TeamChosen == "Miami Heat" {
            homeImage.image = UIImage(named:"heat.png")
            self.view.addSubview(homeImage)
        }
        else if TeamChosen == "Orlando Magic" {
            homeImage.image = UIImage(named:"magic.png")
            self.view.addSubview(homeImage)
        }
        else if TeamChosen == "Washington Wizards" {
            homeImage.image = UIImage(named:"wizards.png")
            self.view.addSubview(homeImage)
        }
        else if TeamChosen == "Golden State Warriors" {
            homeImage.image = UIImage(named:"warriors.png")
            self.view.addSubview(homeImage)
        }
        else if TeamChosen == "LA Clippers" {
            homeImage.image = UIImage(named:"clippers.png")
            self.view.addSubview(homeImage)
        }
        else if TeamChosen == "Los Angeles Lakers" {
            homeImage.image = UIImage(named:"lakers.png")
            self.view.addSubview(homeImage)
        }
        else if TeamChosen == "Phoenix Suns" {
            homeImage.image = UIImage(named:"suns.png")
            self.view.addSubview(homeImage)
        }
        else if TeamChosen == "Sacramento Kings" {
            homeImage.image = UIImage(named:"kings.png")
            self.view.addSubview(homeImage)
        }
        else if TeamChosen == "Dallas Mavericks" {
            homeImage.image = UIImage(named:"dallas.png")
            self.view.addSubview(homeImage)
        }
        else if TeamChosen == "Houston Rockets" {
            homeImage.image = UIImage(named:"rockets.png")
            self.view.addSubview(homeImage)
        }
        else if TeamChosen == "Memphis Grizzlies" {
            homeImage.image = UIImage(named:"memphis.png")
            self.view.addSubview(homeImage)
        }
        else if TeamChosen == "New Orleans Pelicans" {
            homeImage.image = UIImage(named:"pelicans.png")
            self.view.addSubview(homeImage)
        }
        else if TeamChosen == "San Antonio Spurs" {
            homeImage.image = UIImage(named:"spurs.png")
            self.view.addSubview(homeImage)
        }
        else if TeamChosen == "Denver Nuggets" {
            homeImage.image = UIImage(named:"nuggets.png")
            self.view.addSubview(homeImage)
        }
        else if TeamChosen == "Minnesota Timberwolves" {
            homeImage.image = UIImage(named:"timberwolves.png")
            self.view.addSubview(homeImage)
        }
        else if TeamChosen == "Oklahoma City Thunder" {
            homeImage.image = UIImage(named:"thunder.png")
            self.view.addSubview(homeImage)
        }
        else if TeamChosen == "Portland Trail Blazers" {
            homeImage.image = UIImage(named:"blazers.png")
            self.view.addSubview(homeImage)
        }
        else if TeamChosen == "Utah Jazz" {
            homeImage.image = UIImage(named:"jazz.png")
            self.view.addSubview(homeImage)
        }
        
        if awayTeamChosen == "Boston Celtics" {
            visitingImage.image = UIImage(named:"celtics.png")
            self.view.addSubview(visitingImage)
        }
        else if awayTeamChosen == "Brooklyn Nets" {
            visitingImage.image = UIImage(named:"nets.png")
            self.view.addSubview(visitingImage)
        }
        else if awayTeamChosen == "New York Knicks" {
            visitingImage.image = UIImage(named:"knicks.png")
            self.view.addSubview(visitingImage)
        }
        else if awayTeamChosen == "Philadelphia 76ers" {
            visitingImage.image = UIImage(named:"philly.png")
            self.view.addSubview(visitingImage)
        }
        else if awayTeamChosen == "Toronto Raptors" {
            visitingImage.image = UIImage(named:"toronto.png")
            self.view.addSubview(visitingImage)
        }
        else if awayTeamChosen == "Chicago Bulls" {
            visitingImage.image = UIImage(named:"bulls.png")
            self.view.addSubview(visitingImage)
        }
        else if awayTeamChosen == "Cleveland Cavaliers" {
            visitingImage.image = UIImage(named:"cavs.png")
            self.view.addSubview(visitingImage)
        }
        else if awayTeamChosen == "Detroit Pistons" {
            visitingImage.image = UIImage(named:"pistons.png")
            self.view.addSubview(visitingImage)
        }
        else if awayTeamChosen == "Indiana Pacers" {
            visitingImage.image = UIImage(named:"pacers.png")
            self.view.addSubview(visitingImage)
        }
        else if awayTeamChosen == "Milwaukee Bucks" {
            visitingImage.image = UIImage(named:"bucks.png")
            self.view.addSubview(visitingImage)
        }
        else if awayTeamChosen == "Atlanta Hawks" {
            visitingImage.image = UIImage(named:"hawks.png")
            self.view.addSubview(visitingImage)
        }
        else if awayTeamChosen == "Charlotte Hornets" {
            visitingImage.image = UIImage(named:"hornets.png")
            self.view.addSubview(visitingImage)
        }
        else if awayTeamChosen == "Miami Heat" {
            visitingImage.image = UIImage(named:"heat.png")
            self.view.addSubview(visitingImage)
        }
        else if awayTeamChosen == "Orlando Magic" {
            visitingImage.image = UIImage(named:"magic.png")
            self.view.addSubview(visitingImage)
        }
        else if awayTeamChosen == "Washington Wizards" {
            visitingImage.image = UIImage(named:"wizards.png")
            self.view.addSubview(visitingImage)
        }
        else if awayTeamChosen == "Golden State Warriors" {
            visitingImage.image = UIImage(named:"warriors.png")
            self.view.addSubview(visitingImage)
        }
        else if awayTeamChosen == "LA Clippers" {
            visitingImage.image = UIImage(named:"clippers.png")
            self.view.addSubview(visitingImage)
        }
        else if awayTeamChosen == "Los Angeles Lakers" {
            visitingImage.image = UIImage(named:"lakers.png")
            self.view.addSubview(visitingImage)
        }
        else if awayTeamChosen == "Phoenix Suns" {
            visitingImage.image = UIImage(named:"suns.png")
            self.view.addSubview(visitingImage)
        }
        else if awayTeamChosen == "Sacramento Kings" {
            visitingImage.image = UIImage(named:"kings.png")
            self.view.addSubview(visitingImage)
        }
        else if awayTeamChosen == "Dallas Mavericks" {
            visitingImage.image = UIImage(named:"dallas.png")
            self.view.addSubview(visitingImage)
        }
        else if awayTeamChosen == "Houston Rockets" {
            visitingImage.image = UIImage(named:"rockets.png")
            self.view.addSubview(visitingImage)
        }
        else if awayTeamChosen == "Memphis Grizzlies" {
            visitingImage.image = UIImage(named:"memphis.png")
            self.view.addSubview(visitingImage)
        }
        else if awayTeamChosen == "New Orleans Pelicans" {
            visitingImage.image = UIImage(named:"pelicans.png")
            self.view.addSubview(visitingImage)
        }
        else if awayTeamChosen == "San Antonio Spurs" {
            visitingImage.image = UIImage(named:"spurs.png")
            self.view.addSubview(visitingImage)
        }
        else if awayTeamChosen == "Denver Nuggets" {
            visitingImage.image = UIImage(named:"nuggets.png")
            self.view.addSubview(visitingImage)
        }
        else if awayTeamChosen == "Minnesota Timberwolves" {
            visitingImage.image = UIImage(named:"timberwolves.png")
            self.view.addSubview(visitingImage)
        }
        else if awayTeamChosen == "Oklahoma City Thunder" {
            visitingImage.image = UIImage(named:"thunder.png")
            self.view.addSubview(visitingImage)
        }
        else if awayTeamChosen == "Portland Trail Blazers" {
            visitingImage.image = UIImage(named:"blazers.png")
            self.view.addSubview(visitingImage)
        }
        else if awayTeamChosen == "Utah Jazz" {
            visitingImage.image = UIImage(named:"jazz.png")
            self.view.addSubview(visitingImage)
        }
    }
}
