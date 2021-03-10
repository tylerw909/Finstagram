//
//  LoginViewController.swift
//  Finstagram
//
//  Created by Tyler Weisner on 3/8/21.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!

    @IBAction func OnSignIn(_ sender: Any) {
        let username = usernameField.text!
        let password = passwordField.text!

        PFUser.logInWithUsername(inBackground: username, password: password) {
          (user: PFUser?, error: Error?) -> Void in
          if user != nil {
            // Do stuff after successful login.
            self.performSegue(withIdentifier: "loginSegue", sender: nil)
          } else {
            // The login failed. Check error to see why.
            print("Invalid username or password.")
          }
        }
    }
    
    @IBAction func OnSignUp(_ sender: Any) {
        let user = PFUser()
        user.username = usernameField.text
        user.password = passwordField.text

         user.signUpInBackground {
           (succeeded: Bool, error: Error?) -> Void in
            if let error = error {
                let errorString = error.localizedDescription
                // Show the errorString somewhere and let the user try again.
                print("Error in OnSignIn: \(errorString)")
           } else {
                // Hooray! Let them use the app now.
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
           }
         }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
