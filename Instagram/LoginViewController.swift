//
//  LoginViewController.swift
//  Instagram
//
//  Created by SongYuda on 3/7/17.
//  Copyright © 2017 SongYuda. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSignIn(_ sender: Any) {
        PFUser.logInWithUsername(inBackground: usernameField.text!, password: passwordField.text!) { (user, error) in
            if(user != nil) {
                print("logged in")
              self.performSegue(withIdentifier: "SignInSegue", sender: nil)
            }
            
        }
        
    }

    @IBAction func onSignUp(_ sender: Any) {
        let newUser = PFUser()
        
        newUser.username = usernameField.text
        newUser.password = passwordField.text
        
        newUser.signUpInBackground { (success, error) in
            if(success) {
                print("created a user")
                self.performSegue(withIdentifier: "SignInSegue", sender: nil)
            }
            else {
                print(error?.localizedDescription)
            }
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
