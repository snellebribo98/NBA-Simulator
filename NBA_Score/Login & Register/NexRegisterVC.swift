//
//  NexRegisterVC.swift
//  NBA_Score
//
//  Created by Brian van de Velde on 22-12-18.
//  Copyright © 2018 Brian van de Velde. All rights reserved.
//
//  This class lets a user registrate themselves, which is done with the help of firebase.


import UIKit
import Firebase

class NextRegisterVC: UIViewController {
    /// variables
    var Username: String?
    var Password: String?
    var ConfirmPassword: String?
    var Email: String?
    
    /// outlets
    @IBOutlet weak var UsernameTF: UITextField!
    @IBOutlet weak var PasswordTF: UITextField!
    @IBOutlet weak var ConfirmPasswordTF: UITextField!
    @IBOutlet weak var EmailTF: UITextField!
    
    /// initializes view controller
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    /// checks if all textfields are filled in
    /// if passwords don't match give error
    /// create a user with filled in email and password with the help of firebase
    /// if it didn't work print the error
    @IBAction func FinishButtonTapped(sender: AnyObject) {
        Username = UsernameTF.text
        Password = PasswordTF.text
        ConfirmPassword = ConfirmPasswordTF.text
        Email = EmailTF.text
        
        if (Username!.isEmpty) {
            let alert = UIAlertController(title: "Username", message: "You must fillin an username", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
        else if (Password!.isEmpty) {
            let alert = UIAlertController(title: "Password", message: "You must fillin an password", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
        else if (ConfirmPassword!.isEmpty) {
            let alert = UIAlertController(title: "Confirm Password", message: "You must confirm the password", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
        else if (Email!.isEmpty) {
            let alert = UIAlertController(title: "Email", message: "You must fillin an email", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
        else if Password != ConfirmPassword {
            let alert = UIAlertController(title: "Passwords must match", message: "You must fillin identical passwords", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
        else {
            Auth.auth().createUser(withEmail: Email!, password: Password!) { user, error in
                if error == nil && user != nil {
                    print("User created!")
                    
                    let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                    changeRequest?.displayName = self.Username
                    changeRequest?.commitChanges { error in
                        if error == nil {
                            print("Username created!")
                            self.dismiss(animated: false, completion: nil)
                        }
                        else {
                            let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                            
                            alertController.addAction(defaultAction)
                            self.present(alertController, animated: true, completion: nil)
                        }
                    }
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
