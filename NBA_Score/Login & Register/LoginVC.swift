//
//  ViewController.swift
//  NBA_Score
//
//  Created by Brian van de Velde on 21-12-18.
//  Copyright © 2018 Brian van de Velde. All rights reserved.
//

import UIKit

class LoginVC: UIViewController
{
    @IBOutlet weak var UserEmailTF: UITextField!
    @IBOutlet weak var UserPasswordTF: UITextField!
    @IBOutlet weak var login: UIButton!
    
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    var Users = [Any]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        activityIndicator.style = .whiteLarge
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 125, height: 125)
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        view.addSubview(activityIndicator)
        
        activityIndicator.startAnimating()
        UIApplication.shared.beginIgnoringInteractionEvents()
        
        fetchUser { (success) -> Void in
            if success {
                DispatchQueue.main.async {
                    self.activityIndicator.stopAnimating()
                    UIApplication.shared.endIgnoringInteractionEvents()
                    print("HOI")
                    print(self.Users)
                }
            }
        }
    }
   
    @IBAction func unwindToLogin(segue:UIStoryboardSegue) { }
    
    @IBAction func LoginButtonPressed(_ sender: Any)
    {
        let email = UserEmailTF.text
        let password = UserPasswordTF.text
        
        if (email!.isEmpty)
        {
            let alert = UIAlertController(title: "Email", message: "You must fillin an email", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
        else if (password!.isEmpty)
        {
            let alert = UIAlertController(title: "Password", message: "You must fillin an password", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
        
        performSegue(withIdentifier: "LoginSegue", sender: login)
    }
    
    func fetchUser(completion: @escaping (_ success: Bool) -> Void) {
        let url: URL = URL(string: "http://127.0.0.1:5000/users")!
        let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)
        
        let task = defaultSession.dataTask(with: url)
        { (data, response, error) in
            if error != nil{
                print("Failed to download Data")
            }
            else {
                print(data!)
                let jsonDecoder = JSONDecoder()
                print("HOI4")
                if let data = data, let logUserIn = try? jsonDecoder.decode(Login.self, from: data) {
                    print("HOI2")
                    print(logUserIn)
                    self.Users.append(logUserIn)
                    print("HOI3")
                }
            }
            completion(true)
        }
        task.resume()
    }
}
