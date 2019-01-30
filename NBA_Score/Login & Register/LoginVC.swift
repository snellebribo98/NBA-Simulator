//
//  ViewController.swift
//  NBA_Score
//
//  Created by Brian van de Velde on 21-12-18.
//  Copyright © 2018 Brian van de Velde. All rights reserved.
//
//  This class logs the user in if the entered email and password is the same as the firebase database and if the textfields are not empty. It also enables a user to push a button to get send to the next VC and register.


import UIKit
import Firebase

class LoginVC: UIViewController {
    /// outlets
    @IBOutlet weak var UserEmailTF: UITextField!
    @IBOutlet weak var UserPasswordTF: UITextField!
    @IBOutlet weak var login: UIButton!
    @IBOutlet weak var NBAImage: UIImageView!
    
    /// variables
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    /// initializes view controller
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    /// unwind destination
    @IBAction func unwindToLogin(segue:UIStoryboardSegue) { }
    
    /// if user is not nil which happens after a user registers
    /// perform the segue to the next view controller
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if Auth.auth().currentUser != nil {
            self.performSegue(withIdentifier: "loginSegue", sender: self)
        }
    }
    
    /// func checks if textfields are not empty
    /// then checks if the email and password match eachother through firebase
    /// if so login and perform segue to next view controller
    /// if not show error message
    @IBAction func LoginButtonPressed(_ sender: Any) {
        let Email = UserEmailTF.text
        let Password = UserPasswordTF.text
        
        if (Email!.isEmpty) {
            let alert = UIAlertController(title: "Email", message: "You must fillin an email", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
        else if (Password!.isEmpty) {
            let alert = UIAlertController(title: "Password", message: "You must fillin an password", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
        else {
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
