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
    @IBOutlet weak var visitingImage: UIImageView!
    @IBOutlet weak var visitingOffenseLabel: UILabel!
    @IBOutlet weak var visitingDefenseLabel: UILabel!
    @IBOutlet weak var visitingTotalLabel: UILabel!
    @IBOutlet weak var visitingPicker: UIPickerView!
    
    @IBOutlet weak var homeImage: UIImageView!
    @IBOutlet weak var homeOffenseLabel: UILabel!
    @IBOutlet weak var homeDefenseLabel: UILabel!
    @IBOutlet weak var homeOveralLabel: UILabel!
    @IBOutlet weak var homePicker: UIPickerView!
    
    private let NBA_Data_Home = ["Boston Celtics", "Brooklyn Nets", "New York Knicks", "Philadelphia 76ers", "Toronto Raptors", "Chicago Bulls", "Cleveland Cavaliers", "Detroit Pistons", "Indiana Pacers", "Milwaukee Bucks", "Atlanta Hawks", "Charlotte Hornets", "Miami Heat", "Orlando Magic", "Washington Wizards", "Golden State Warriors", "Los Angeles Clippers", "Los Angeles Lakers", "Phoenix Suns", "Sacramento Kings", "Dallas Mavericks", "Houston Rockets", "Memphis Grizzilies", "New Orleans Pelicans", "San Antonio Spurs", "Denver Nuggets", "Minnesota Timberwolves", "Oklahoma Thunder", "Portland Trail Blaizers", "Utah Jazz"]
    private let NBA_Data_Away = ["Boston Celtics", "Brooklyn Nets", "New York Knicks"]
    
    private var homeComponent = 0
    private var awayComponent = 1
    
    var TeamChosen: String = "Boston Celtics"
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        visitingPicker.dataSource = self
        visitingPicker.delegate = self
        homePicker.dataSource = self
        homePicker.delegate = self
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
        }
        else if component == awayComponent
        {
            TeamChosen = NBA_Data_Away[row]
            
            if TeamChosen == "Boston Celtics"
            {
                visitingImage.image = UIImage(named:"celtics.png")
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

}
