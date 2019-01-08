//
//  RegisterVC.swift
//  NBA_Score
//
//  Created by Brian van de Velde on 21-12-18.
//  Copyright © 2018 Brian van de Velde. All rights reserved.
//

import UIKit

class RegisterVC: UIViewController
{
    @IBOutlet weak var UserEmailTF: UITextField!
    @IBOutlet weak var UserPasswordTF: UITextField!
    @IBOutlet weak var UserPasswordAgainTF: UITextField!
    
    var email: String?
    var password: String?
    var passwordAgain: String?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    @IBAction func unwindToRegister(segue:UIStoryboardSegue) { }
    
    @IBAction func NextButtonTapped(sender: AnyObject)
    {
        email = UserEmailTF.text
        password = UserPasswordTF.text
        passwordAgain = UserPasswordAgainTF.text
        
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
        else if (passwordAgain!.isEmpty)
        {
            let alert = UIAlertController(title: "Password again", message: "You must confirm your password", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
        else if (password != passwordAgain)
        {
            let alert = UIAlertController(title: "Passwords don't match", message: "You must eneter the same password twice", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
        
        performSegue(withIdentifier: "nextSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "nextSegue"
        {
            let NextRegisterVC = segue.destination as! NextRegisterVC
            NextRegisterVC.email = self.email
            NextRegisterVC.password = self.password
        }
    }
}
