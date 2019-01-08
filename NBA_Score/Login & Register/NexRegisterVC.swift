//
//  NexRegisterVC.swift
//  NBA_Score
//
//  Created by Brian van de Velde on 22-12-18.
//  Copyright © 2018 Brian van de Velde. All rights reserved.
//

import UIKit

class NextRegisterVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource
{
    var firstName: String?
    var lastName: String?
    var username: String?
    var CountryName: String?
    var email: String?
    var password: String?
    var TeamChosen: String = ""
    
    private let NBA_Data = ["Boston Celtics", "Brooklyn Nets", "New York Knicks", "Philadelphia 76ers", "Toronto Raptors", "Chicago Bulls", "Cleveland Cavaliers", "Detroit Pistons", "Indiana Pacers", "Milwaukee Bucks", "Atlanta Hawks", "Charlotte Hornets", "Miami Heat", "Orlando Magic", "Washington Wizards", "Golden State Warriors", "Los Angeles Clippers", "Los Angeles Lakers", "Phoenix Suns", "Sacramento Kings", "Dallas Mavericks", "Houston Rockets", "Memphis Grizzilies", "New Orleans Pelicans", "San Antonio Spurs", "Denver Nuggets", "Minnesota Timberwolves", "Oklahoma Thunder", "Portland Trail Blaizers", "Utah Jazz"]
    
    @IBOutlet weak var FirstNameTF: UITextField!
    @IBOutlet weak var LastNameTF: UITextField!
    @IBOutlet weak var UsernameTF: UITextField!
    @IBOutlet weak var CountryNameTF: UITextField!
    @IBOutlet weak var FavoriteNBATeamPicker: UIPickerView!
    @IBOutlet weak var NBALabel: UILabel!
    @IBOutlet weak var TeamImage: UIImageView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        FavoriteNBATeamPicker.dataSource = self
        FavoriteNBATeamPicker.delegate = self
    }
    
    @IBAction func FinishButtonTapped(sender: AnyObject)
    {
        firstName = FirstNameTF.text
        lastName = LastNameTF.text
        username = UsernameTF.text
        CountryName = CountryNameTF.text
        
        if (firstName!.isEmpty)
        {
            let alert = UIAlertController(title: "First name", message: "You must fillin an first name", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
        else if (lastName!.isEmpty)
        {
            let alert = UIAlertController(title: "Second name", message: "You must fillin an second name", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
        else if (username!.isEmpty)
        {
            let alert = UIAlertController(title: "Username", message: "You must fillin an username", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
        else if (CountryName!.isEmpty)
        {
            let alert = UIAlertController(title: "Country", message: "You must confirm your country", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
        else
        {
            submitAccount(email: self.email, password: self.password, firstName: self.firstName, lastName: self.lastName, username: self.username, CountryName: self.CountryName, NBA_Team: self.TeamChosen)
        }
        
        performSegue(withIdentifier: "RegisteredSegue", sender: nil)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return NBA_Data.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        TeamChosen = NBA_Data[row]
        NBALabel.text = NBA_Data[row]
        
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
        else if TeamChosen == "Los Angeles Clippers"
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
        else if TeamChosen == "Memphis Grizzilies"
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
        else if TeamChosen == "Oklahoma Thunder"
        {
            self.view.backgroundColor = UIColor.init(red:0.20, green:0.69, blue:0.97, alpha:1.0)
            TeamImage.image = UIImage(named:"thunder.png")
            self.view.addSubview(TeamImage)
        }
        else if TeamChosen == "Portland Trail Blaizers"
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
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return NBA_Data[row]
    }
    
    func submitAccount(email: String?, password: String?, firstName: String?, lastName: String?, username: String?, CountryName: String?, NBA_Team: String?)
    {
        let url = URL(string: "https://ide50-brianvdvelde.cs50.io:8080/users")!
        var request = URLRequest(url: url)
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        let postString = "email=\(email!)&password=\(password!)&firstname=\(firstName!)&lastname=\(lastName!)&username=\(username!)&country=\(CountryName!)&NBA_Team=\(TeamChosen)"
        request.httpBody = postString.data(using: .utf8)
        let task = URLSession.shared.dataTask(with: request)
        { data, response, error in
            guard let data = data, error == nil else
            {
                print("error=\(error!)")
                return
            }
            
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200
            {
                print("statusCode should be 200, but is \(httpStatus.statusCode)")
                print("response = \(response!)")
            }
            
            let responseString = String(data: data, encoding: .utf8)
            print("responseString = \(responseString!)")
        }
        task.resume()
    }
}
