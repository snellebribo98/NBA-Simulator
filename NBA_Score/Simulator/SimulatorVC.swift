//
//  SimulatorVC.swift
//  NBA_Score
//
//  Created by Brian van de Velde on 29-12-18.
//  Copyright © 2018 Brian van de Velde. All rights reserved.
//
//  This class shows a pickerview with two elements where the user can select the teams the user wants to simulate. There are labels that show the home and away teams rating, and a image view that shows the team image. When simulate is clicked there is a message shown for a couple of seconds, a simulation is made with the game result and a segue to the next view controller is performed.


import UIKit


class SimulatorVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    /// outlets
    @IBOutlet weak var visitingImage: UIImageView!
    @IBOutlet weak var visitingOffenseLabel: UILabel!
    @IBOutlet weak var visitingDefenseLabel: UILabel!
    @IBOutlet weak var visitingTotalLabel: UILabel!
    @IBOutlet weak var homeImage: UIImageView!
    @IBOutlet weak var homeOffenseLabel: UILabel!
    @IBOutlet weak var homeDefenseLabel: UILabel!
    @IBOutlet weak var homeOveralLabel: UILabel!
    @IBOutlet weak var homePicker: UIPickerView!
    @IBOutlet weak var simulateButton: UIButton!
    
    /// variables
    private var NBA_Data_Home = [String]()
    private var NBA_Data_Away = [String]()
    private var homeComponent = 0
    private var awayComponent = 1
    var teamDetailss = [String: Team]()
    var homeScore: Int = 0
    var visitingScore: Int = 0
    var TeamChosen: String = ""
    var awayTeamChosen: String = ""
    var myTimer: Timer!
    
    /// if this button is pressed the showwait function is called and the simulation function
    @IBAction func simulateButton(_ sender: Any) {
        showWait()
        
        self.simulator()
    }
    
    /// unwind destination
    @IBAction func unwindToSimulator(segue:UIStoryboardSegue) { }
    
    /// initializes view controller and calls function getnums and simulator
    /// updates the labels according to which teams are selected in the picker
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homePicker.dataSource = self
        homePicker.delegate = self
        
        getNums()
        updateLabel(component: 0, row: 0)
        updateLabel(component: 1, row: 0)
        simulator()
    }
    
    /// function that fills a list with all the teamIDs
    func getNums() {
        for teamdetail in teamDetailss
        {
            NBA_Data_Away.append(teamdetail.key)
            NBA_Data_Home.append(teamdetail.key)
        }
    }
    
    /// updates the label of the team ratings and team image of the selected team
    func updateLabel(component: Int, row: Int) {
        if component == 0 {
            TeamChosen = NBA_Data_Home[row]
            
            homeOffenseLabel.text = String((teamDetailss[TeamChosen]?.offensiveRating)!)
            homeDefenseLabel.text = String((teamDetailss[TeamChosen]?.defensiveRating)!)
            homeOveralLabel.text = String((teamDetailss[TeamChosen]?.overalRating)!)
            
            if teamDetailss[TeamChosen]?.fullName == "Boston Celtics" {
                homeImage.image = UIImage(named:"celtics.png")
                self.view.addSubview(homeImage)
            }
            else if teamDetailss[TeamChosen]?.fullName == "Brooklyn Nets" {
                homeImage.image = UIImage(named:"nets.png")
                self.view.addSubview(homeImage)
            }
            else if teamDetailss[TeamChosen]?.fullName == "New York Knicks" {
                homeImage.image = UIImage(named:"knicks.png")
                self.view.addSubview(homeImage)
            }
            else if teamDetailss[TeamChosen]?.fullName == "Philadelphia 76ers" {
                homeImage.image = UIImage(named:"philly.png")
                self.view.addSubview(homeImage)
            }
            else if teamDetailss[TeamChosen]?.fullName == "Toronto Raptors" {
                homeImage.image = UIImage(named:"toronto.png")
                self.view.addSubview(homeImage)
            }
            else if teamDetailss[TeamChosen]?.fullName == "Chicago Bulls" {
                homeImage.image = UIImage(named:"bulls.png")
                self.view.addSubview(homeImage)
            }
            else if teamDetailss[TeamChosen]?.fullName == "Cleveland Cavaliers" {
                homeImage.image = UIImage(named:"cavs.png")
                self.view.addSubview(homeImage)
            }
            else if teamDetailss[TeamChosen]?.fullName == "Detroit Pistons" {
                homeImage.image = UIImage(named:"pistons.png")
                self.view.addSubview(homeImage)
            }
            else if teamDetailss[TeamChosen]?.fullName == "Indiana Pacers" {
                homeImage.image = UIImage(named:"pacers.png")
                self.view.addSubview(homeImage)
            }
            else if teamDetailss[TeamChosen]?.fullName == "Milwaukee Bucks" {
                homeImage.image = UIImage(named:"bucks.png")
                self.view.addSubview(homeImage)
            }
            else if teamDetailss[TeamChosen]?.fullName == "Atlanta Hawks" {
                homeImage.image = UIImage(named:"hawks.png")
                self.view.addSubview(homeImage)
            }
            else if teamDetailss[TeamChosen]?.fullName == "Charlotte Hornets" {
                homeImage.image = UIImage(named:"hornets.png")
                self.view.addSubview(homeImage)
            }
            else if teamDetailss[TeamChosen]?.fullName == "Miami Heat" {
                homeImage.image = UIImage(named:"heat.png")
                self.view.addSubview(homeImage)
            }
            else if teamDetailss[TeamChosen]?.fullName == "Orlando Magic" {
                homeImage.image = UIImage(named:"magic.png")
                self.view.addSubview(homeImage)
            }
            else if teamDetailss[TeamChosen]?.fullName == "Washington Wizards" {
                homeImage.image = UIImage(named:"wizards.png")
                self.view.addSubview(homeImage)
            }
            else if teamDetailss[TeamChosen]?.fullName == "Golden State Warriors" {
                homeImage.image = UIImage(named:"warriors.png")
                self.view.addSubview(homeImage)
            }
            else if teamDetailss[TeamChosen]?.fullName == "LA Clippers" {
                homeImage.image = UIImage(named:"clippers.png")
                self.view.addSubview(homeImage)
            }
            else if teamDetailss[TeamChosen]?.fullName == "Los Angeles Lakers" {
                homeImage.image = UIImage(named:"lakers.png")
                self.view.addSubview(homeImage)
            }
            else if teamDetailss[TeamChosen]?.fullName == "Phoenix Suns" {
                homeImage.image = UIImage(named:"suns.png")
                self.view.addSubview(homeImage)
            }
            else if teamDetailss[TeamChosen]?.fullName == "Sacramento Kings" {
                homeImage.image = UIImage(named:"kings.png")
                self.view.addSubview(homeImage)
            }
            else if teamDetailss[TeamChosen]?.fullName == "Dallas Mavericks" {
                homeImage.image = UIImage(named:"dallas.png")
                self.view.addSubview(homeImage)
            }
            else if teamDetailss[TeamChosen]?.fullName == "Houston Rockets" {
                homeImage.image = UIImage(named:"rockets.png")
                self.view.addSubview(homeImage)
            }
            else if teamDetailss[TeamChosen]?.fullName == "Memphis Grizzlies" {
                homeImage.image = UIImage(named:"memphis.png")
                self.view.addSubview(homeImage)
            }
            else if teamDetailss[TeamChosen]?.fullName == "New Orleans Pelicans" {
                homeImage.image = UIImage(named:"pelicans.png")
                self.view.addSubview(homeImage)
            }
            else if teamDetailss[TeamChosen]?.fullName == "San Antonio Spurs" {
                homeImage.image = UIImage(named:"spurs.png")
                self.view.addSubview(homeImage)
            }
            else if teamDetailss[TeamChosen]?.fullName == "Denver Nuggets" {
                homeImage.image = UIImage(named:"nuggets.png")
                self.view.addSubview(homeImage)
            }
            else if teamDetailss[TeamChosen]?.fullName == "Minnesota Timberwolves" {
                homeImage.image = UIImage(named:"timberwolves.png")
                self.view.addSubview(homeImage)
            }
            else if teamDetailss[TeamChosen]?.fullName == "Oklahoma City Thunder" {
                homeImage.image = UIImage(named:"thunder.png")
                self.view.addSubview(homeImage)
            }
            else if teamDetailss[TeamChosen]?.fullName == "Portland Trail Blazers" {
                homeImage.image = UIImage(named:"blazers.png")
                self.view.addSubview(homeImage)
            }
            else if teamDetailss[TeamChosen]?.fullName == "Utah Jazz" {
                homeImage.image = UIImage(named:"jazz.png")
                self.view.addSubview(homeImage)
            }
        }
        else if component == 1 {
            awayTeamChosen = NBA_Data_Away[row]
            
            visitingOffenseLabel.text = String((teamDetailss[awayTeamChosen]?.offensiveRating)!)
            visitingDefenseLabel.text = String((teamDetailss[awayTeamChosen]?.defensiveRating)!)
            visitingTotalLabel.text = String((teamDetailss[awayTeamChosen]?.overalRating)!)
            
            if teamDetailss[awayTeamChosen]?.fullName == "Boston Celtics" {
                visitingImage.image = UIImage(named:"celtics.png")
                self.view.addSubview(visitingImage)
            }
            else if teamDetailss[awayTeamChosen]?.fullName == "Brooklyn Nets" {
                visitingImage.image = UIImage(named:"nets.png")
                self.view.addSubview(visitingImage)
            }
            else if teamDetailss[awayTeamChosen]?.fullName == "New York Knicks" {
                visitingImage.image = UIImage(named:"knicks.png")
                self.view.addSubview(visitingImage)
            }
            else if teamDetailss[awayTeamChosen]?.fullName == "Philadelphia 76ers" {
                visitingImage.image = UIImage(named:"philly.png")
                self.view.addSubview(visitingImage)
            }
            else if teamDetailss[awayTeamChosen]?.fullName == "Toronto Raptors" {
                visitingImage.image = UIImage(named:"toronto.png")
                self.view.addSubview(visitingImage)
            }
            else if teamDetailss[awayTeamChosen]?.fullName == "Chicago Bulls" {
                visitingImage.image = UIImage(named:"bulls.png")
                self.view.addSubview(visitingImage)
            }
            else if teamDetailss[awayTeamChosen]?.fullName == "Cleveland Cavaliers" {
                visitingImage.image = UIImage(named:"cavs.png")
                self.view.addSubview(visitingImage)
            }
            else if teamDetailss[awayTeamChosen]?.fullName == "Detroit Pistons" {
                visitingImage.image = UIImage(named:"pistons.png")
                self.view.addSubview(visitingImage)
            }
            else if teamDetailss[awayTeamChosen]?.fullName == "Indiana Pacers" {
                visitingImage.image = UIImage(named:"pacers.png")
                self.view.addSubview(visitingImage)
            }
            else if teamDetailss[awayTeamChosen]?.fullName == "Milwaukee Bucks" {
                visitingImage.image = UIImage(named:"bucks.png")
                self.view.addSubview(visitingImage)
            }
            else if teamDetailss[awayTeamChosen]?.fullName == "Atlanta Hawks" {
                visitingImage.image = UIImage(named:"hawks.png")
                self.view.addSubview(visitingImage)
            }
            else if teamDetailss[awayTeamChosen]?.fullName == "Charlotte Hornets" {
                visitingImage.image = UIImage(named:"hornets.png")
                self.view.addSubview(visitingImage)
            }
            else if teamDetailss[awayTeamChosen]?.fullName == "Miami Heat" {
                visitingImage.image = UIImage(named:"heat.png")
                self.view.addSubview(visitingImage)
            }
            else if teamDetailss[awayTeamChosen]?.fullName == "Orlando Magic" {
                visitingImage.image = UIImage(named:"magic.png")
                self.view.addSubview(visitingImage)
            }
            else if teamDetailss[awayTeamChosen]?.fullName == "Washington Wizards" {
                visitingImage.image = UIImage(named:"wizards.png")
                self.view.addSubview(visitingImage)
            }
            else if teamDetailss[awayTeamChosen]?.fullName == "Golden State Warriors" {
                visitingImage.image = UIImage(named:"warriors.png")
                self.view.addSubview(visitingImage)
            }
            else if teamDetailss[awayTeamChosen]?.fullName == "LA Clippers" {
                visitingImage.image = UIImage(named:"clippers.png")
                self.view.addSubview(visitingImage)
            }
            else if teamDetailss[awayTeamChosen]?.fullName == "Los Angeles Lakers" {
                visitingImage.image = UIImage(named:"lakers.png")
                self.view.addSubview(visitingImage)
            }
            else if teamDetailss[awayTeamChosen]?.fullName == "Phoenix Suns" {
                visitingImage.image = UIImage(named:"suns.png")
                self.view.addSubview(visitingImage)
            }
            else if teamDetailss[awayTeamChosen]?.fullName == "Sacramento Kings" {
                visitingImage.image = UIImage(named:"kings.png")
                self.view.addSubview(visitingImage)
            }
            else if teamDetailss[awayTeamChosen]?.fullName == "Dallas Mavericks" {
                visitingImage.image = UIImage(named:"dallas.png")
                self.view.addSubview(visitingImage)
            }
            else if teamDetailss[awayTeamChosen]?.fullName == "Houston Rockets" {
                visitingImage.image = UIImage(named:"rockets.png")
                self.view.addSubview(visitingImage)
            }
            else if teamDetailss[awayTeamChosen]?.fullName == "Memphis Grizzlies" {
                visitingImage.image = UIImage(named:"memphis.png")
                self.view.addSubview(visitingImage)
            }
            else if teamDetailss[awayTeamChosen]?.fullName == "New Orleans Pelicans" {
                visitingImage.image = UIImage(named:"pelicans.png")
                self.view.addSubview(visitingImage)
            }
            else if teamDetailss[awayTeamChosen]?.fullName == "San Antonio Spurs" {
                visitingImage.image = UIImage(named:"spurs.png")
                self.view.addSubview(visitingImage)
            }
            else if teamDetailss[awayTeamChosen]?.fullName == "Denver Nuggets" {
                visitingImage.image = UIImage(named:"nuggets.png")
                self.view.addSubview(visitingImage)
            }
            else if teamDetailss[awayTeamChosen]?.fullName == "Minnesota Timberwolves" {
                visitingImage.image = UIImage(named:"timberwolves.png")
                self.view.addSubview(visitingImage)
            }
            else if teamDetailss[awayTeamChosen]?.fullName == "Oklahoma City Thunder" {
                visitingImage.image = UIImage(named:"thunder.png")
                self.view.addSubview(visitingImage)
            }
            else if teamDetailss[awayTeamChosen]?.fullName == "Portland Trail Blazers" {
                visitingImage.image = UIImage(named:"blazers.png")
                self.view.addSubview(visitingImage)
            }
            else if teamDetailss[awayTeamChosen]?.fullName == "Utah Jazz" {
                visitingImage.image = UIImage(named:"jazz.png")
                self.view.addSubview(visitingImage)
            }
        }
    }
    
    /// the ratings are used to find a score for that team using randomizers
    func simulator() {
        let HO = teamDetailss[TeamChosen]?.offensiveRating
        let HD = teamDetailss[TeamChosen]?.defensiveRating
        let H = teamDetailss[TeamChosen]?.overalRating
        let VO = teamDetailss[awayTeamChosen]?.offensiveRating
        let VD = teamDetailss[awayTeamChosen]?.defensiveRating
        let V = teamDetailss[awayTeamChosen]?.overalRating
        
        let homeSuck = Int.random(in: 1 ... 5)
        if homeSuck == 5 {
            let HL = min(HO!, HD!, H!) + 40
            let HU = max(HO!, HD!, H!) + 50
            homeScore = Int.random(in: HL ... HU)
        }
        else {
            let HL = min(HO!, HD!, H!) + 49
            let HU = max(HO!, HD!, H!) + 79
            homeScore = Int.random(in: HL ... HU)
        }
        
        let awayBlowout = Int.random(in: 1 ... 5)
        if awayBlowout == 5 {
            let VL = min(VO!, VD!, V!) + 70
            let VU = max(VO!, VD!, V!) + 80
            visitingScore = Int.random(in: VL ... VU)
        }
        else {
            let VL = min(VO!, VD!, V!) + 39
            let VU = max(VO!, VD!, V!) + 69
            visitingScore = Int.random(in: VL ... VU)
        }
    }
    
    /// numbers of components in the pickerview
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    /// number of rows in the pickerview
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == homeComponent {
            return NBA_Data_Home.count
        }
        else {
            return NBA_Data_Away.count
        }
    }
    
    /// updates the labels as soon as the view controller is loaded and calls function simulator
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        updateLabel(component: component, row: row)
        simulator()
    }
    
    /// shows the fullname of the NBA teams in the pickerview
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == homeComponent {
            let name = teamDetailss[NBA_Data_Home[row]]?.fullName
            return name
        }
        else {
            if NBA_Data_Away[row] == "Select a Team" {
                return NBA_Data_Away[0]
            } else {
                let name = teamDetailss[NBA_Data_Away[row]]?.fullName
                return name
            }
        }
    }
    
    /// alert function that shows a message for 2 seconds and then performs the segue to the next view controller
    func showWait() {
        let alert = UIAlertController(title: "Crunching the numbers!", message: "Please wait", preferredStyle: .alert)
        self.present(alert, animated: true, completion: nil)
        
        let subview = (alert.view.subviews.first?.subviews.first?.subviews.first!)! as UIView
        subview.layer.cornerRadius = 1
        subview.backgroundColor = UIColor(red:0.61, green:0.60, blue:0.60, alpha:1.0)
        
        Timer.scheduledTimer(withTimeInterval: 2, repeats: false, block: { _ in alert.dismiss(animated: true, completion: { () -> Void in
            self.performSegue(withIdentifier: "simulatorResultSegue", sender: Any?.self)
        })})
    }
    
    /// prepares the home and away team name and both scores to the next view controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "simulatorResultSegue" {
            let SRVC = segue.destination as! SimulatorResultVC
            SRVC.TeamChosen = (self.teamDetailss[TeamChosen]?.fullName)!
            SRVC.awayTeamChosen = (self.teamDetailss[awayTeamChosen]?.fullName)!
            SRVC.homeScore = self.homeScore
            SRVC.visitingScore = self.visitingScore
        }
    }
    
}
