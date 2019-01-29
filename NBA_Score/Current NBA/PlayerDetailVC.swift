//
//  PlayerDetailVC.swift
//  NBA_Score
//
//  Created by Brian van de Velde on 11-01-19.
//  Copyright © 2019 Brian van de Velde. All rights reserved.
//

import UIKit

class PlayerDetailVC: UIViewController
{
    @IBOutlet weak var PlayerFirstnameLabel: UILabel!
    @IBOutlet weak var PlayerLastnameLabel: UILabel!
    
    @IBOutlet weak var HeightLabel: UILabel!
    @IBOutlet weak var WeightLabel: UILabel!
    @IBOutlet weak var TeamLabel: UILabel!
    @IBOutlet weak var CountryLabel: UILabel!
    @IBOutlet weak var CollegeLabel: UILabel!
    @IBOutlet weak var dateOfBirthLabel: UILabel!
    @IBOutlet weak var OverallLabel: UILabel!
    @IBOutlet weak var DefensiveLabel: UILabel!
    @IBOutlet weak var OffensiveLabel: UILabel!
    
    @IBOutlet weak var ppgLabel: UILabel!
    @IBOutlet weak var apgLabel: UILabel!
    @IBOutlet weak var rpgLabel: UILabel!
    @IBOutlet weak var mpgLabel: UILabel!
    
    @IBOutlet weak var TeamImage: UIImageView!
    
    @IBOutlet weak var firstNameTextLabel: UILabel!
    @IBOutlet weak var lastNameTextLabel: UILabel!
    
    
    var playerList: Player?
    var TeamChosen: String?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        updateUI()
        print(playerList)
        print("-----")
        print("Def Reb pg = ", playerList?.stats?.defRebpg)
        print("Off Reb pg = ", playerList?.stats?.offRebpg)
        print("fieldgoal rating = ", playerList?.stats?.fgRating)
        print("freetrow rating = ", playerList?.stats?.ftRating)
        print("-----")
        print("Overal weight = ", playerList?.stats?.overallRatingWeighted)
        print("defence weight = ", playerList?.stats?.defensiveRatingWeighted)
        print("offensive weight = ", playerList?.stats?.offensiveRatingWeighted)

    }
    
    func updateUI()
    {
        team()
        
        PlayerFirstnameLabel.text = playerList?.firstName
        
        if playerList?.firstName == "Nene"
        {
            firstNameTextLabel.text = "Nickname:  "
            lastNameTextLabel.text = "Fullname:   "
            PlayerLastnameLabel.text = "Maybyner Rodney Hilário"
        }
        else
        {
            PlayerLastnameLabel.text = playerList?.lastName
        }
        
        if playerList?.heightFeet == "-" && playerList?.heightInches == "-"
        {
            HeightLabel.text = "Unknown"
            WeightLabel.text = "Unknown"
        }
        else
        {
            HeightLabel.text = ((playerList?.heightFeet)! + " ft " + (playerList?.heightInches)!)
            WeightLabel.text = ((playerList?.weightPounds)! + " lbs")
        }
        
        dateOfBirthLabel.text = playerList?.dateOfBirthUTC 
        TeamLabel.text = TeamChosen
        
        if playerList?.country == "Democratic Republic of the Congo" {
            CountryLabel.text = "DR Congo"
        }
        else {
            CountryLabel.text = playerList?.country
        }
        
        if playerList?.collegeName == "Germany" || playerList?.collegeName == "" || playerList?.collegeName == "Sao Carlos, Brazil" || playerList?.collegeName == "Wurzburg, Germany" || playerList?.collegeName == "Greece" || playerList?.collegeName == "Lisieux, France" || playerList?.collegeName == "Bologna, Italy" || playerList?.collegeName == "Lubumbashi, DR Congo" || playerList?.collegeName == "Villanueva de la Serena, Spain" || playerList?.collegeName == "Yavne, Israel" || playerList?.collegeName == "Ljubljana, Slovenia" || playerList?.collegeName == "France" || playerList?.collegeName == "Sant'Angelo Lodigiano, Italy" || playerList?.collegeName == "Barcelona, Spain" || playerList?.collegeName == "Lodz, Poland" || playerList?.collegeName == "Spain" || playerList?.collegeName == "Croatia" || playerList?.collegeName == "Brazzaville, Rep. of Congo" || playerList?.collegeName == "Eskisehir, Turkey" || playerList?.collegeName == "Kinna, Sweden" || playerList?.collegeName == "Rouen, France" || playerList?.collegeName == "St. Petersburg, Russia" || playerList?.collegeName == "Anadolu efes" || playerList?.collegeName == "Tbilisi, Georgia" || playerList?.collegeName == "Paris, France" || playerList?.collegeName == "El Masnou, Spain" || playerList?.collegeName == "Vevey, Switzerland" || playerList?.collegeName == "Utena, Lithuania"
        {
            CollegeLabel.text = "Didn't attend College"
        }
        else
        {
            CollegeLabel.text = playerList?.collegeName
        }
        
        OverallLabel.text = String((playerList?.stats?.overallRating)!)
        DefensiveLabel.text = String((playerList?.stats?.defensiveRating)!)
        OffensiveLabel.text = String((playerList?.stats?.offensiveRating)!)
        
        if playerList?.stats?.ppg == "-1" && playerList?.stats?.apg == "-1" && playerList?.stats?.rpg == "-1" && playerList?.stats?.mpg == "-1"
        {
            ppgLabel.text = "No stats available"
            apgLabel.text = "No stats available"
            rpgLabel.text = "No stats available"
            mpgLabel.text = "No stats available"
        }
        else
        {
            ppgLabel.text = String((playerList?.stats?.ppg)!)
            apgLabel.text = String((playerList?.stats?.apg)!)
            rpgLabel.text = String((playerList?.stats?.rpg)!)
            mpgLabel.text = String((playerList?.stats?.mpg)!)
        }

        teamLooks()
    }
    
    func team()
    {
        let playerTeam: String = (playerList?.teamId)!
        
        if playerTeam == "1610612738"
        {
            TeamChosen = "Boston Celtics"
        }
        else if playerTeam == "1610612737"
        {
            TeamChosen = "Atlanta Hawks"
        }
        else if playerTeam == "1610612751"
        {
            TeamChosen = "Brooklyn Nets"
        }
        else if playerTeam == "1610612766"
        {
            TeamChosen = "Charlotte Hornets"
        }
        else if playerTeam == "1610612741"
        {
            TeamChosen = "Chicago Bulls"
        }
        else if playerTeam == "1610612739"
        {
            TeamChosen = "Cleveland Cavaliers"
        }
        else if playerTeam == "1610612742"
        {
            TeamChosen = "Dallas Mavericks"
        }
        else if playerTeam == "1610612743"
        {
            TeamChosen = "Denver Nuggets"
        }
        else if playerTeam == "1610612765"
        {
            TeamChosen = "Detroit Pistons"
        }
        else if playerTeam == "1610612744"
        {
            TeamChosen = "Golden State Warriors"
        }
        else if playerTeam == "1610612745"
        {
            TeamChosen = "Houston Rockets"
        }
        else if playerTeam == "1610612754"
        {
            TeamChosen = "Indiana Pacers"
        }
        else if playerTeam == "1610612746"
        {
            TeamChosen = "LA Clippers"
        }
        else if playerTeam == "1610612747"
        {
            TeamChosen = "Los Angeles Lakers"
        }
        else if playerTeam == "1610612763"
        {
            TeamChosen = "Memphis Grizzlies"
        }
        else if playerTeam == "1610612748"
        {
            TeamChosen = "Miami Heat"
        }
        else if playerTeam == "1610612749"
        {
            TeamChosen = "Milwaukee Bucks"
        }
        else if playerTeam == "1610612750"
        {
            TeamChosen = "Minnesota Timberwolves"
        }
        else if playerTeam == "1610612740"
        {
            TeamChosen = "New Orleans Pelicans"
        }
        else if playerTeam == "1610612752"
        {
            TeamChosen = "New York Knicks"
        }
        else if playerTeam == "1610612760"
        {
            TeamChosen = "Oklahoma City Thunder"
        }
        else if playerTeam == "1610612753"
        {
            TeamChosen = "Orlando Magic"
        }
        else if playerTeam == "1610612755"
        {
            TeamChosen = "Philadelphia 76ers"
        }
        else if playerTeam == "1610612756"
        {
            TeamChosen = "Phoenix Suns"
        }
        else if playerTeam == "1610612757"
        {
            TeamChosen = "Portland Trail Blazers"
        }
        else if playerTeam == "1610612758"
        {
            TeamChosen = "Sacramento Kings"
        }
        else if playerTeam == "1610612759"
        {
            TeamChosen = "San Antonio Spurs"
        }
        else if playerTeam == "1610612761"
        {
            TeamChosen = "Toronto Raptors"
        }
        else if playerTeam == "1610612762"
        {
            TeamChosen = "Utah Jazz"
        }
        else if playerTeam == "1610612764"
        {
            TeamChosen = "Washington Wizards"
        }
        else
        {
            TeamChosen = "Free Agent"
        }
    }
    
    func teamLooks()
    {
        if TeamChosen == "Boston Celtics"
        {
            self.view.backgroundColor = UIColor.init(red:0.25, green:0.78, blue:0.49, alpha:1.0)
            TeamImage.image = UIImage(named:"celtics.png")
            self.view.addSubview(TeamImage)
        }
        else if TeamChosen == "Brooklyn Nets"
        {
            self.view.backgroundColor = UIColor.init(red:0.78, green:0.80, blue:0.79, alpha:1.0)
            TeamImage.image = UIImage(named:"nets.png")
            self.view.addSubview(TeamImage)
        }
        else if TeamChosen == "New York Knicks"
        {
            self.view.backgroundColor = UIColor.init(red:0.15, green:0.25, blue:0.77, alpha:1.0)
            TeamImage.image = UIImage(named:"knicks.png")
            self.view.addSubview(TeamImage)
        }
        else if TeamChosen == "Philadelphia 76ers"
        {
            self.view.backgroundColor = UIColor.init(red:0.94, green:0.05, blue:0.27, alpha:1.0)
            TeamImage.image = UIImage(named:"philly.png")
            self.view.addSubview(TeamImage)
        }
        else if TeamChosen == "Toronto Raptors"
        {
            self.view.backgroundColor = UIColor.init(red:0.87, green:0.07, blue:0.26, alpha:1.0)
            TeamImage.image = UIImage(named:"toronto.png")
            self.view.addSubview(TeamImage)
        }
        else if TeamChosen == "Chicago Bulls"
        {
            self.view.backgroundColor = UIColor.init(red:0.98, green:0.09, blue:0.09, alpha:1.0)
            TeamImage.image = UIImage(named:"bulls.png")
            self.view.addSubview(TeamImage)
        }
        else if TeamChosen == "Cleveland Cavaliers"
        {
            self.view.backgroundColor = UIColor.init(red:0.55, green:0.00, blue:0.00, alpha:1.0)
            TeamImage.image = UIImage(named:"cavs.png")
            self.view.addSubview(TeamImage)
        }
        else if TeamChosen == "Detroit Pistons"
        {
            self.view.backgroundColor = UIColor.init(red:0.98, green:0.09, blue:0.09, alpha:1.0)
            TeamImage.image = UIImage(named:"pistons.png")
            self.view.addSubview(TeamImage)
        }
        else if TeamChosen == "Indiana Pacers"
        {
            self.view.backgroundColor = UIColor.init(red:0.94, green:0.94, blue:0.12, alpha:1.0)
            TeamImage.image = UIImage(named:"pacers.png")
            self.view.addSubview(TeamImage)
        }
        else if TeamChosen == "Milwaukee Bucks"
        {
            self.view.backgroundColor = UIColor.init(red:0.13, green:0.54, blue:0.13, alpha:1.0)
            TeamImage.image = UIImage(named:"bucks.png")
            self.view.addSubview(TeamImage)
        }
        else if TeamChosen == "Atlanta Hawks"
        {
            self.view.backgroundColor = UIColor.init(red:0.98, green:0.09, blue:0.09, alpha:1.0)
            TeamImage.image = UIImage(named:"hawks.png")
            self.view.addSubview(TeamImage)
        }
        else if TeamChosen == "Charlotte Hornets"
        {
            self.view.backgroundColor = UIColor.init(red:0.07, green:0.11, blue:0.85, alpha:1.0)
            TeamImage.image = UIImage(named:"hornets.png")
            self.view.addSubview(TeamImage)
        }
        else if TeamChosen == "Miami Heat"
        {
            self.view.backgroundColor = UIColor.init(red:0.69, green:0.15, blue:0.31, alpha:1.0)
            TeamImage.image = UIImage(named:"heat.png")
            self.view.addSubview(TeamImage)
        }
        else if TeamChosen == "Orlando Magic"
        {
            self.view.backgroundColor = UIColor.init(red:0.13, green:0.06, blue:0.99, alpha:1.0)
            TeamImage.image = UIImage(named:"magic.png")
            self.view.addSubview(TeamImage)
        }
        else if TeamChosen == "Washington Wizards"
        {
            self.view.backgroundColor = UIColor.init(red:0.94, green:0.07, blue:0.23, alpha:1.0)
            TeamImage.image = UIImage(named:"wizards.png")
            self.view.addSubview(TeamImage)
        }
        else if TeamChosen == "Golden State Warriors"
        {
            self.view.backgroundColor = UIColor.init(red:0.98, green:0.88, blue:0.04, alpha:1.0)
            TeamImage.image = UIImage(named:"warriors.png")
            self.view.addSubview(TeamImage)
        }
        else if TeamChosen == "LA Clippers"
        {
            self.view.backgroundColor = UIColor.init(red:0.98, green:0.04, blue:0.15, alpha:1.0)
            TeamImage.image = UIImage(named:"clippers.png")
            self.view.addSubview(TeamImage)
        }
        else if TeamChosen == "Los Angeles Lakers"
        {
            self.view.backgroundColor = UIColor.init(red:0.98, green:0.88, blue:0.04, alpha:1.0)
            TeamImage.image = UIImage(named:"lakers.png")
            self.view.addSubview(TeamImage)
        }
        else if TeamChosen == "Phoenix Suns"
        {
            self.view.backgroundColor = UIColor.init(red:0.96, green:0.52, blue:0.11, alpha:1.0)
            TeamImage.image = UIImage(named:"suns.png")
            self.view.addSubview(TeamImage)
        }
        else if TeamChosen == "Sacramento Kings"
        {
            self.view.backgroundColor = UIColor.init(red:0.64, green:0.11, blue:0.96, alpha:1.0)
            TeamImage.image = UIImage(named:"kings.png")
            self.view.addSubview(TeamImage)
        }
        else if TeamChosen == "Dallas Mavericks"
        {
            self.view.backgroundColor = UIColor.init(red:0.11, green:0.60, blue:0.96, alpha:1.0)
            TeamImage.image = UIImage(named:"dallas.png")
            self.view.addSubview(TeamImage)
        }
        else if TeamChosen == "Houston Rockets"
        {
            self.view.backgroundColor = UIColor.init(red:0.93, green:0.75, blue:0.75, alpha:1.0)
            TeamImage.image = UIImage(named:"rockets.png")
            self.view.addSubview(TeamImage)
        }
        else if TeamChosen == "Memphis Grizzlies"
        {
            self.view.backgroundColor = UIColor.init(red:0.19, green:0.40, blue:0.82, alpha:1.0)
            TeamImage.image = UIImage(named:"memphis.png")
            self.view.addSubview(TeamImage)
        }
        else if TeamChosen == "New Orleans Pelicans"
        {
            self.view.backgroundColor = UIColor.init(red:0.98, green:0.04, blue:0.15, alpha:1.0)
            TeamImage.image = UIImage(named:"pelicans.png")
            self.view.addSubview(TeamImage)
        }
        else if TeamChosen == "San Antonio Spurs"
        {
            self.view.backgroundColor = UIColor.init(red:0.58, green:0.59, blue:0.61, alpha:1.0)
            TeamImage.image = UIImage(named:"spurs.png")
            self.view.addSubview(TeamImage)
        }
        else if TeamChosen == "Denver Nuggets"
        {
            self.view.backgroundColor = UIColor.init(red:0.93, green:0.93, blue:0.09, alpha:1.0)
            TeamImage.image = UIImage(named:"nuggets.png")
            self.view.addSubview(TeamImage)
        }
        else if TeamChosen == "Minnesota Timberwolves"
        {
            self.view.backgroundColor = UIColor.init(red:0.04, green:0.15, blue:0.68, alpha:1.0)
            TeamImage.image = UIImage(named:"timberwolves.png")
            self.view.addSubview(TeamImage)
        }
        else if TeamChosen == "Oklahoma City Thunder"
        {
            self.view.backgroundColor = UIColor.init(red:0.20, green:0.69, blue:0.97, alpha:1.0)
            TeamImage.image = UIImage(named:"thunder.png")
            self.view.addSubview(TeamImage)
        }
        else if TeamChosen == "Portland Trail Blazers"
        {
            self.view.backgroundColor = UIColor.init(red:0.81, green:0.02, blue:0.22, alpha:1.0)
            TeamImage.image = UIImage(named:"blazers.png")
            self.view.addSubview(TeamImage)
        }
        else if TeamChosen == "Utah Jazz"
        {
            self.view.backgroundColor = UIColor.init(red:0.05, green:0.15, blue:0.61, alpha:1.0)
            TeamImage.image = UIImage(named:"jazz.png")
            self.view.addSubview(TeamImage)
        }
        else if TeamChosen == "Free Agent"
        {
            self.view.backgroundColor = UIColor.init(red:0.78, green:0.80, blue:0.79, alpha:1.0)
            TeamImage.image = UIImage(named:"nba-logo.png")
            self.view.addSubview(TeamImage)
        }
    }
}

