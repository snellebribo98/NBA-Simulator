//
//  SimulatorVC.swift
//  NBA_Score
//
//  Created by Brian van de Velde on 29-12-18.
//  Copyright © 2018 Brian van de Velde. All rights reserved.
//

import UIKit

class SimulatorVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource
{
    @IBAction func unwindToSimulator(segue:UIStoryboardSegue) { }
    
    @IBOutlet weak var visitingImage: UIImageView!
    @IBOutlet weak var visitingOffenseLabel: UILabel!
    @IBOutlet weak var visitingDefenseLabel: UILabel!
    @IBOutlet weak var visitingTotalLabel: UILabel!
    
    @IBOutlet weak var homeImage: UIImageView!
    @IBOutlet weak var homeOffenseLabel: UILabel!
    @IBOutlet weak var homeDefenseLabel: UILabel!
    @IBOutlet weak var homeOveralLabel: UILabel!
    @IBOutlet weak var homePicker: UIPickerView!
    
    private let NBA_Data_Home = ["Boston Celtics", "Brooklyn Nets", "New York Knicks", "Philadelphia 76ers", "Toronto Raptors", "Chicago Bulls", "Cleveland Cavaliers", "Detroit Pistons", "Indiana Pacers", "Milwaukee Bucks", "Atlanta Hawks", "Charlotte Hornets", "Miami Heat", "Orlando Magic", "Washington Wizards", "Golden State Warriors", "Los Angeles Clippers", "Los Angeles Lakers", "Phoenix Suns", "Sacramento Kings", "Dallas Mavericks", "Houston Rockets", "Memphis Grizzilies", "New Orleans Pelicans", "San Antonio Spurs", "Denver Nuggets", "Minnesota Timberwolves", "Oklahoma Thunder", "Portland Trail Blaizers", "Utah Jazz"]
    private let NBA_Data_Away = ["Boston Celtics", "Brooklyn Nets", "New York Knicks", "Philadelphia 76ers", "Toronto Raptors", "Chicago Bulls", "Cleveland Cavaliers", "Detroit Pistons", "Indiana Pacers", "Milwaukee Bucks", "Atlanta Hawks", "Charlotte Hornets", "Miami Heat", "Orlando Magic", "Washington Wizards", "Golden State Warriors", "Los Angeles Clippers", "Los Angeles Lakers", "Phoenix Suns", "Sacramento Kings", "Dallas Mavericks", "Houston Rockets", "Memphis Grizzilies", "New Orleans Pelicans", "San Antonio Spurs", "Denver Nuggets", "Minnesota Timberwolves", "Oklahoma Thunder", "Portland Trail Blaizers", "Utah Jazz"]
    
    private var homeComponent = 0
    private var awayComponent = 1
    
    var homeScore: Int = 0
    var visitingScore: Int = 0
    
    var TeamChosen: String = "Boston Celtics"
    var awayTeamChosen: String = "Boston Celtics"
    
    @IBAction func simulateGame(_ sender: Any)
    {
        simulator()
    }
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        homePicker.dataSource = self
        homePicker.delegate = self
        
        simulator()
    }
    
    func simulator()
    {
        let HO = 83
        let HD = 77
        let H = 81
        let VO = 85
        let VD = 83
        let V = 84
        
        visitingOffenseLabel.text = String(HO)
        visitingDefenseLabel.text = String(HD)
        visitingTotalLabel.text = String(H)
        
        homeOffenseLabel.text = String(VO)
        homeDefenseLabel.text = String(VD)
        homeOveralLabel.text = String(V)
        
        let homeSuck = Int.random(in: 1 ... 5)
        if homeSuck == 5
        {
            let HL = min(HO, HD, H) + 10
            let HU = max(HO, HD, H) + 10
            homeScore = Int.random(in: HL ... HU)
        }
        else
        {
            let HL = min(HO, HD, H) + 25
            let HU = max(HO, HD, H) + 25
            homeScore = Int.random(in: HL ... HU)
        }
        print(homeScore)
        
        let awayBlowout = Int.random(in: 1 ... 5)
        if awayBlowout == 5
        {
            let VL = min(VO, VD, V) + 30
            let VU = max(VO, VD, V) + 30
            visitingScore = Int.random(in: VL ... VU)
        }
        else
        {
            let VL = min(VO, VD, V) + 15
            let VU = max(VO, VD, V) + 15
            visitingScore = Int.random(in: VL ... VU)
        }
        print(visitingScore)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        if component == homeComponent
        {
            return NBA_Data_Home.count
        }
        else
        {
            return NBA_Data_Away.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        if component == homeComponent
        {
            TeamChosen = NBA_Data_Home[row]
            
            if TeamChosen == "Boston Celtics"
            {
                homeImage.image = UIImage(named:"celtics.png")
                self.view.addSubview(homeImage)
            }
            else if TeamChosen == "Brooklyn Nets"
            {
                homeImage.image = UIImage(named:"nets.png")
                self.view.addSubview(homeImage)
            }
            else if TeamChosen == "New York Knicks"
            {
                homeImage.image = UIImage(named:"knicks.png")
                self.view.addSubview(homeImage)
            }
            else if TeamChosen == "Philadelphia 76ers"
            {
                homeImage.image = UIImage(named:"philly.png")
                self.view.addSubview(homeImage)
            }
            else if TeamChosen == "Toronto Raptors"
            {
                homeImage.image = UIImage(named:"toronto.png")
                self.view.addSubview(homeImage)
            }
            else if TeamChosen == "Chicago Bulls"
            {
                homeImage.image = UIImage(named:"bulls.png")
                self.view.addSubview(homeImage)
            }
            else if TeamChosen == "Cleveland Cavaliers"
            {
                homeImage.image = UIImage(named:"cavs.png")
                self.view.addSubview(homeImage)
            }
            else if TeamChosen == "Detroit Pistons"
            {
                homeImage.image = UIImage(named:"pistons.png")
                self.view.addSubview(homeImage)
            }
            else if TeamChosen == "Indiana Pacers"
            {
                homeImage.image = UIImage(named:"pacers.png")
                self.view.addSubview(homeImage)
            }
            else if TeamChosen == "Milwaukee Bucks"
            {
                homeImage.image = UIImage(named:"bucks.png")
                self.view.addSubview(homeImage)
            }
            else if TeamChosen == "Atlanta Hawks"
            {
                homeImage.image = UIImage(named:"hawks.png")
                self.view.addSubview(homeImage)
            }
            else if TeamChosen == "Charlotte Hornets"
            {
                homeImage.image = UIImage(named:"hornets.png")
                self.view.addSubview(homeImage)
            }
            else if TeamChosen == "Miami Heat"
            {
                homeImage.image = UIImage(named:"heat.png")
                self.view.addSubview(homeImage)
            }
            else if TeamChosen == "Orlando Magic"
            {
                homeImage.image = UIImage(named:"magic.png")
                self.view.addSubview(homeImage)
            }
            else if TeamChosen == "Washington Wizards"
            {
                homeImage.image = UIImage(named:"wizards.png")
                self.view.addSubview(homeImage)
            }
            else if TeamChosen == "Golden State Warriors"
            {
                homeImage.image = UIImage(named:"warriors.png")
                self.view.addSubview(homeImage)
            }
            else if TeamChosen == "Los Angeles Clippers"
            {
                homeImage.image = UIImage(named:"clippers.png")
                self.view.addSubview(homeImage)
            }
            else if TeamChosen == "Los Angeles Lakers"
            {
                homeImage.image = UIImage(named:"lakers.png")
                self.view.addSubview(homeImage)
            }
            else if TeamChosen == "Phoenix Suns"
            {
                homeImage.image = UIImage(named:"suns.png")
                self.view.addSubview(homeImage)
            }
            else if TeamChosen == "Sacramento Kings"
            {
                homeImage.image = UIImage(named:"kings.png")
                self.view.addSubview(homeImage)
            }
            else if TeamChosen == "Dallas Mavericks"
            {
                homeImage.image = UIImage(named:"dallas.png")
                self.view.addSubview(homeImage)
            }
            else if TeamChosen == "Houston Rockets"
            {
                homeImage.image = UIImage(named:"rockets.png")
                self.view.addSubview(homeImage)
            }
            else if TeamChosen == "Memphis Grizzilies"
            {
                homeImage.image = UIImage(named:"memphis.png")
                self.view.addSubview(homeImage)
            }
            else if TeamChosen == "New Orleans Pelicans"
            {
                homeImage.image = UIImage(named:"pelicans.png")
                self.view.addSubview(homeImage)
            }
            else if TeamChosen == "San Antonio Spurs"
            {
                homeImage.image = UIImage(named:"spurs.png")
                self.view.addSubview(homeImage)
            }
            else if TeamChosen == "Denver Nuggets"
            {
                homeImage.image = UIImage(named:"nuggets.png")
                self.view.addSubview(homeImage)
            }
            else if TeamChosen == "Minnesota Timberwolves"
            {
                homeImage.image = UIImage(named:"timberwolves.png")
                self.view.addSubview(homeImage)
            }
            else if TeamChosen == "Oklahoma Thunder"
            {
                homeImage.image = UIImage(named:"thunder.png")
                self.view.addSubview(homeImage)
            }
            else if TeamChosen == "Portland Trail Blaizers"
            {
                homeImage.image = UIImage(named:"blazers.png")
                self.view.addSubview(homeImage)
            }
            else if TeamChosen == "Utah Jazz"
            {
                homeImage.image = UIImage(named:"jazz.png")
                self.view.addSubview(homeImage)
            }
        }
        else if component == awayComponent
        {
            awayTeamChosen = NBA_Data_Away[row]
            
            if awayTeamChosen == "Boston Celtics"
            {
                visitingImage.image = UIImage(named:"celtics.png")
                self.view.addSubview(visitingImage)
            }
            else if awayTeamChosen == "Brooklyn Nets"
            {
                visitingImage.image = UIImage(named:"nets.png")
                self.view.addSubview(visitingImage)
            }
            else if awayTeamChosen == "New York Knicks"
            {
                visitingImage.image = UIImage(named:"knicks.png")
                self.view.addSubview(visitingImage)
            }
            else if awayTeamChosen == "Philadelphia 76ers"
            {
                visitingImage.image = UIImage(named:"philly.png")
                self.view.addSubview(visitingImage)
            }
            else if awayTeamChosen == "Toronto Raptors"
            {
                visitingImage.image = UIImage(named:"toronto.png")
                self.view.addSubview(visitingImage)
            }
            else if awayTeamChosen == "Chicago Bulls"
            {
                visitingImage.image = UIImage(named:"bulls.png")
                self.view.addSubview(visitingImage)
            }
            else if awayTeamChosen == "Cleveland Cavaliers"
            {
                visitingImage.image = UIImage(named:"cavs.png")
                self.view.addSubview(visitingImage)
            }
            else if awayTeamChosen == "Detroit Pistons"
            {
                visitingImage.image = UIImage(named:"pistons.png")
                self.view.addSubview(visitingImage)
            }
            else if awayTeamChosen == "Indiana Pacers"
            {
                visitingImage.image = UIImage(named:"pacers.png")
                self.view.addSubview(visitingImage)
            }
            else if awayTeamChosen == "Milwaukee Bucks"
            {
                visitingImage.image = UIImage(named:"bucks.png")
                self.view.addSubview(visitingImage)
            }
            else if awayTeamChosen == "Atlanta Hawks"
            {
                visitingImage.image = UIImage(named:"hawks.png")
                self.view.addSubview(visitingImage)
            }
            else if awayTeamChosen == "Charlotte Hornets"
            {
                visitingImage.image = UIImage(named:"hornets.png")
                self.view.addSubview(visitingImage)
            }
            else if awayTeamChosen == "Miami Heat"
            {
                visitingImage.image = UIImage(named:"heat.png")
                self.view.addSubview(visitingImage)
            }
            else if awayTeamChosen == "Orlando Magic"
            {
                visitingImage.image = UIImage(named:"magic.png")
                self.view.addSubview(visitingImage)
            }
            else if awayTeamChosen == "Washington Wizards"
            {
                visitingImage.image = UIImage(named:"wizards.png")
                self.view.addSubview(visitingImage)
            }
            else if awayTeamChosen == "Golden State Warriors"
            {
                visitingImage.image = UIImage(named:"warriors.png")
                self.view.addSubview(visitingImage)
            }
            else if awayTeamChosen == "Los Angeles Clippers"
            {
                visitingImage.image = UIImage(named:"clippers.png")
                self.view.addSubview(visitingImage)
            }
            else if awayTeamChosen == "Los Angeles Lakers"
            {
                visitingImage.image = UIImage(named:"lakers.png")
                self.view.addSubview(visitingImage)
            }
            else if awayTeamChosen == "Phoenix Suns"
            {
                visitingImage.image = UIImage(named:"suns.png")
                self.view.addSubview(visitingImage)
            }
            else if awayTeamChosen == "Sacramento Kings"
            {
                visitingImage.image = UIImage(named:"kings.png")
                self.view.addSubview(visitingImage)
            }
            else if awayTeamChosen == "Dallas Mavericks"
            {
                visitingImage.image = UIImage(named:"dallas.png")
                self.view.addSubview(visitingImage)
            }
            else if awayTeamChosen == "Houston Rockets"
            {
                visitingImage.image = UIImage(named:"rockets.png")
                self.view.addSubview(visitingImage)
            }
            else if awayTeamChosen == "Memphis Grizzilies"
            {
                visitingImage.image = UIImage(named:"memphis.png")
                self.view.addSubview(visitingImage)
            }
            else if awayTeamChosen == "New Orleans Pelicans"
            {
                visitingImage.image = UIImage(named:"pelicans.png")
                self.view.addSubview(visitingImage)
            }
            else if awayTeamChosen == "San Antonio Spurs"
            {
                visitingImage.image = UIImage(named:"spurs.png")
                self.view.addSubview(visitingImage)
            }
            else if awayTeamChosen == "Denver Nuggets"
            {
                visitingImage.image = UIImage(named:"nuggets.png")
                self.view.addSubview(visitingImage)
            }
            else if awayTeamChosen == "Minnesota Timberwolves"
            {
                visitingImage.image = UIImage(named:"timberwolves.png")
                self.view.addSubview(visitingImage)
            }
            else if awayTeamChosen == "Oklahoma Thunder"
            {
                visitingImage.image = UIImage(named:"thunder.png")
                self.view.addSubview(visitingImage)
            }
            else if awayTeamChosen == "Portland Trail Blaizers"
            {
                visitingImage.image = UIImage(named:"blazers.png")
                self.view.addSubview(visitingImage)
            }
            else if awayTeamChosen == "Utah Jazz"
            {
                visitingImage.image = UIImage(named:"jazz.png")
                self.view.addSubview(visitingImage)
            }
        }

    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        if component == homeComponent
        {
            return NBA_Data_Home[row]
        }
        else
        {
            return NBA_Data_Away[row]
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "simulatorResultSegue"
        {
            let SRVC = segue.destination as! SimulatorResultVC
            SRVC.TeamChosen = self.TeamChosen
            SRVC.awayTeamChosen = self.awayTeamChosen
            SRVC.homeScore = self.homeScore
            SRVC.visitingScore = self.visitingScore
        }
    }

}
