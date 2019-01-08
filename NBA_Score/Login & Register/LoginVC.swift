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
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
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
}
