//
//  ViewController.swift
//  NBA_Score
//
//  Created by Brian van de Velde on 21-12-18.
//  Copyright © 2018 Brian van de Velde. All rights reserved.
//

import UIKit
import Firebase

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
    }
   
    @IBAction func unwindToLogin(segue:UIStoryboardSegue) { }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if Auth.auth().currentUser != nil {
            self.performSegue(withIdentifier: "loginSegue", sender: self)
        }
    }
    
    @IBAction func LoginButtonPressed(_ sender: Any)
    {
        let Email = UserEmailTF.text
        let Password = UserPasswordTF.text
        
        if (Email!.isEmpty)
        {
            let alert = UIAlertController(title: "Email", message: "You must fillin an email", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
        else if (Password!.isEmpty)
        {
            let alert = UIAlertController(title: "Password", message: "You must fillin an password", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
        else
        {
            Auth.auth().signIn(withEmail: Email!, password: Password!) { (user, error) in
                if error == nil {
                    self.performSegue(withIdentifier: "loginSegue", sender: self)
                }
                else {
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    
                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
    
}
