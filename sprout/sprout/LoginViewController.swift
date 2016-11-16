//
//  LoginViewController.swift
//  sprout
//
//  Created by Renee Esses on 11/15/16.
//  Copyright © 2016 Yating Zhan. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    let LoginToSprout = "LoginToSprout"
    let appDel = UIApplication.shared.delegate! as! AppDelegate
    
    @IBOutlet weak var emailTextView: UITextField!
    
    @IBOutlet weak var passwordTextView: UITextField!
    
    @IBAction func LoginDidTouch(_ sender: AnyObject) {
        FIRAuth.auth()!.signIn(withEmail: emailTextView.text!,
                               password: passwordTextView.text!)
    }
    
    
    @IBAction func SignupDidTouch(_ sender: AnyObject) {
        let alert = UIAlertController(title: "Register",
                                      message: "Register",
                                      preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Save",
                                       style: .default) { action in
                                        // 1
                                        let emailField = alert.textFields![0]
                                        let passwordField = alert.textFields![1]
                                        
                                        // 2
                                        FIRAuth.auth()!.createUser(withEmail: emailField.text!,
                                                                   password: passwordField.text!) { user, error in
                                                                    if error == nil {
                                                                        // 3
                                                                        FIRAuth.auth()!.signIn(withEmail: self.emailTextView.text!,
                                                                                               password: self.passwordTextView.text!)
                                                                    }
                                                                    else{
                                                                        print(error)
                                                                    }
                                        }
                                        
        }
        
        let cancelAction = UIAlertAction(title: "Cancel",
                                         style: .default)
        
        alert.addTextField { textEmail in
            textEmail.placeholder = "Enter your parent's email"
        }
        
        alert.addTextField { textPassword in
            textPassword.isSecureTextEntry = true
            textPassword.placeholder = "Enter your password"
        }
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        FIRAuth.auth()!.addStateDidChangeListener() { auth, user in
            if user != nil {
                self.appDel.user = User(authData: user!, firstName: "Renee", lastName: "Esses")
                self.performSegue(withIdentifier: self.LoginToSprout, sender: nil)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTextView {
            passwordTextView.becomeFirstResponder()
        }
        if textField == passwordTextView {
            textField.resignFirstResponder()
        }
        return true
    }
    
}
