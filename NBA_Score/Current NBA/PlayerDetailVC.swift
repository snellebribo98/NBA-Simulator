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
    @IBOutlet weak var ConferanceLabel: UILabel!
    @IBOutlet weak var DivisionLabel: UILabel!
    @IBOutlet weak var CountryLabel: UILabel!
    @IBOutlet weak var DraftLabel: UILabel!
    @IBOutlet weak var CollegeLabel: UILabel!
    
    @IBOutlet weak var OverallLabel: UILabel!
    @IBOutlet weak var DefensiveLabel: UILabel!
    @IBOutlet weak var OffensiveLabel: UILabel!
    
    @IBOutlet weak var ppgLabel: UILabel!
    @IBOutlet weak var apgLabel: UILabel!
    @IBOutlet weak var rpgLabel: UILabel!
    @IBOutlet weak var mpgLabel: UILabel!
    
    @IBOutlet weak var TeamImage: UIImageView!
    
    var playerList: [Player]?
    var TeamChosen: String?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI()
    {
//        TeamChosen =
//
//        PlayerFirstnameLabel.text =
//        PlayerLastnameLabel.text =
//        HeightLabel.text =
//        WeightLabel.text =
//        TeamLabel.text =
//        ConferanceLabel.text =
//        DivisionLabel.text =
//        CountryLabel.text =
//        DraftLabel.text =
//        CollegeLabel.text =
//
//        OverallLabel.text =
//        DefensiveLabel.text =
//        OffensiveLabel.text =
//
//        ppgLabel.text =
//        apgLabel.text =
//        rpgLabel.text =
//        mpgLabel.text =
//        
//
//        if TeamChosen == "Boston Celtics"
//        {
//            self.view.backgroundColor = UIColor.init(red:0.25, green:0.78, blue:0.49, alpha:1.0)
//            TeamImage.image = UIImage(named:"celtics.png")
//            self.view.addSubview(TeamImage)
//        }
//        else if TeamChosen == "Brooklyn Nets"
//        {
//            self.view.backgroundColor = UIColor.init(red:0.78, green:0.80, blue:0.79, alpha:1.0)
//            TeamImage.image = UIImage(named:"nets.png")
//            self.view.addSubview(TeamImage)
//        }
//        else if TeamChosen == "New York Knicks"
//        {
//            self.view.backgroundColor = UIColor.init(red:0.15, green:0.25, blue:0.77, alpha:1.0)
//            TeamImage.image = UIImage(named:"knicks.png")
//            self.view.addSubview(TeamImage)
//        }
//        else if TeamChosen == "Philadelphia 76ers"
//        {
//            self.view.backgroundColor = UIColor.init(red:0.94, green:0.05, blue:0.27, alpha:1.0)
//            TeamImage.image = UIImage(named:"philly.png")
//            self.view.addSubview(TeamImage)
//        }
//        else if TeamChosen == "Toronto Raptors"
//        {
//            self.view.backgroundColor = UIColor.init(red:0.87, green:0.07, blue:0.26, alpha:1.0)
//            TeamImage.image = UIImage(named:"toronto.png")
//            self.view.addSubview(TeamImage)
//        }
//        else if TeamChosen == "Chicago Bulls"
//        {
//            self.view.backgroundColor = UIColor.init(red:0.98, green:0.09, blue:0.09, alpha:1.0)
//            TeamImage.image = UIImage(named:"bulls.png")
//            self.view.addSubview(TeamImage)
//        }
//        else if TeamChosen == "Cleveland Cavaliers"
//        {
//            self.view.backgroundColor = UIColor.init(red:0.55, green:0.00, blue:0.00, alpha:1.0)
//            TeamImage.image = UIImage(named:"cavs.png")
//            self.view.addSubview(TeamImage)
//        }
//        else if TeamChosen == "Detroit Pistons"
//        {
//            self.view.backgroundColor = UIColor.init(red:0.98, green:0.09, blue:0.09, alpha:1.0)
//            TeamImage.image = UIImage(named:"pistons.png")
//            self.view.addSubview(TeamImage)
//        }
//        else if TeamChosen == "Indiana Pacers"
//        {
//            self.view.backgroundColor = UIColor.init(red:0.94, green:0.94, blue:0.12, alpha:1.0)
//            TeamImage.image = UIImage(named:"pacers.png")
//            self.view.addSubview(TeamImage)
//        }
//        else if TeamChosen == "Milwaukee Bucks"
//        {
//            self.view.backgroundColor = UIColor.init(red:0.13, green:0.54, blue:0.13, alpha:1.0)
//            TeamImage.image = UIImage(named:"bucks.png")
//            self.view.addSubview(TeamImage)
//        }
//        else if TeamChosen == "Atlanta Hawks"
//        {
//            self.view.backgroundColor = UIColor.init(red:0.98, green:0.09, blue:0.09, alpha:1.0)
//            TeamImage.image = UIImage(named:"hawks.png")
//            self.view.addSubview(TeamImage)
//        }
//        else if TeamChosen == "Charlotte Hornets"
//        {
//            self.view.backgroundColor = UIColor.init(red:0.07, green:0.11, blue:0.85, alpha:1.0)
//            TeamImage.image = UIImage(named:"hornets.png")
//            self.view.addSubview(TeamImage)
//        }
//        else if TeamChosen == "Miami Heat"
//        {
//            self.view.backgroundColor = UIColor.init(red:0.69, green:0.15, blue:0.31, alpha:1.0)
//            TeamImage.image = UIImage(named:"heat.png")
//            self.view.addSubview(TeamImage)
//        }
//        else if TeamChosen == "Orlando Magic"
//        {
//            self.view.backgroundColor = UIColor.init(red:0.13, green:0.06, blue:0.99, alpha:1.0)
//            TeamImage.image = UIImage(named:"magic.png")
//            self.view.addSubview(TeamImage)
//        }
//        else if TeamChosen == "Washington Wizards"
//        {
//            self.view.backgroundColor = UIColor.init(red:0.94, green:0.07, blue:0.23, alpha:1.0)
//            TeamImage.image = UIImage(named:"wizards.png")
//            self.view.addSubview(TeamImage)
//        }
//        else if TeamChosen == "Golden State Warriors"
//        {
//            self.view.backgroundColor = UIColor.init(red:0.98, green:0.88, blue:0.04, alpha:1.0)
//            TeamImage.image = UIImage(named:"warriors.png")
//            self.view.addSubview(TeamImage)
//        }
//        else if TeamChosen == "Los Angeles Clippers"
//        {
//            self.view.backgroundColor = UIColor.init(red:0.98, green:0.04, blue:0.15, alpha:1.0)
//            TeamImage.image = UIImage(named:"clippers.png")
//            self.view.addSubview(TeamImage)
//        }
//        else if TeamChosen == "Los Angeles Lakers"
//        {
//            self.view.backgroundColor = UIColor.init(red:0.98, green:0.88, blue:0.04, alpha:1.0)
//            TeamImage.image = UIImage(named:"lakers.png")
//            self.view.addSubview(TeamImage)
//        }
//        else if TeamChosen == "Phoenix Suns"
//        {
//            self.view.backgroundColor = UIColor.init(red:0.96, green:0.52, blue:0.11, alpha:1.0)
//            TeamImage.image = UIImage(named:"suns.png")
//            self.view.addSubview(TeamImage)
//        }
//        else if TeamChosen == "Sacramento Kings"
//        {
//            self.view.backgroundColor = UIColor.init(red:0.64, green:0.11, blue:0.96, alpha:1.0)
//            TeamImage.image = UIImage(named:"kings.png")
//            self.view.addSubview(TeamImage)
//        }
//        else if TeamChosen == "Dallas Mavericks"
//        {
//            self.view.backgroundColor = UIColor.init(red:0.11, green:0.60, blue:0.96, alpha:1.0)
//            TeamImage.image = UIImage(named:"dallas.png")
//            self.view.addSubview(TeamImage)
//        }
//        else if TeamChosen == "Houston Rockets"
//        {
//            self.view.backgroundColor = UIColor.init(red:0.93, green:0.75, blue:0.75, alpha:1.0)
//            TeamImage.image = UIImage(named:"rockets.png")
//            self.view.addSubview(TeamImage)
//        }
//        else if TeamChosen == "Memphis Grizzilies"
//        {
//            self.view.backgroundColor = UIColor.init(red:0.19, green:0.40, blue:0.82, alpha:1.0)
//            TeamImage.image = UIImage(named:"memphis.png")
//            self.view.addSubview(TeamImage)
//        }
//        else if TeamChosen == "New Orleans Pelicans"
//        {
//            self.view.backgroundColor = UIColor.init(red:0.98, green:0.04, blue:0.15, alpha:1.0)
//            TeamImage.image = UIImage(named:"pelicans.png")
//            self.view.addSubview(TeamImage)
//        }
//        else if TeamChosen == "San Antonio Spurs"
//        {
//            self.view.backgroundColor = UIColor.init(red:0.58, green:0.59, blue:0.61, alpha:1.0)
//            TeamImage.image = UIImage(named:"spurs.png")
//            self.view.addSubview(TeamImage)
//        }
//        else if TeamChosen == "Denver Nuggets"
//        {
//            self.view.backgroundColor = UIColor.init(red:0.93, green:0.93, blue:0.09, alpha:1.0)
//            TeamImage.image = UIImage(named:"nuggets.png")
//            self.view.addSubview(TeamImage)
//        }
//        else if TeamChosen == "Minnesota Timberwolves"
//        {
//            self.view.backgroundColor = UIColor.init(red:0.04, green:0.15, blue:0.68, alpha:1.0)
//            TeamImage.image = UIImage(named:"timberwolves.png")
//            self.view.addSubview(TeamImage)
//        }
//        else if TeamChosen == "Oklahoma Thunder"
//        {
//            self.view.backgroundColor = UIColor.init(red:0.20, green:0.69, blue:0.97, alpha:1.0)
//            TeamImage.image = UIImage(named:"thunder.png")
//            self.view.addSubview(TeamImage)
//        }
//        else if TeamChosen == "Portland Trail Blaizers"
//        {
//            self.view.backgroundColor = UIColor.init(red:0.81, green:0.02, blue:0.22, alpha:1.0)
//            TeamImage.image = UIImage(named:"blazers.png")
//            self.view.addSubview(TeamImage)
//        }
//        else if TeamChosen == "Utah Jazz"
//        {
//            self.view.backgroundColor = UIColor.init(red:0.05, green:0.15, blue:0.61, alpha:1.0)
//            TeamImage.image = UIImage(named:"jazz.png")
//            self.view.addSubview(TeamImage)
//        }
    }
}

