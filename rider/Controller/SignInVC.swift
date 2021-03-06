//
//  SignInVC.swift
//  rider
//
//  Created by erickArciniega on 03/09/18.
//  Copyright © 2018 erickArciniega. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignInVC: UIViewController {
    
    private let RIDER_SEGUE = "RiderVC";

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func logIn(_ sender: Any) {
        
        if emailTextField.text != "" && passwordTextField.text != "" {
            AuthProvider.Instance.login(withEmail: emailTextField.text!, password: passwordTextField.text!, loginHandler:  { (message) in

                if message != nil {
                    self.alertTheUser(title: "Problem with authentication", message: message!);
                }else {
                    self.performSegue(withIdentifier: self.RIDER_SEGUE, sender: nil);
                }

            });
        }else {
            alertTheUser(title: "Email And Password Are Required", message: "Please enter email and password in the text fields")
        }
        
    }
    @IBAction func signUp(_ sender: Any) {
        
        if emailTextField.text != "" && passwordTextField.text != "" {
            
            AuthProvider.Instance.signUp(withEmail: emailTextField.text!, password: passwordTextField.text!) { (message) in
                
                if message != nil {
                    self.alertTheUser(title: "Problen With Creating A New User", message: message!);
                }else{
                    self.performSegue(withIdentifier: self.RIDER_SEGUE, sender: nil);
                }
            }
            
        }else {
            alertTheUser(title: "Email And Password Are Required", message: "Please enter email and password in the text fields")
        }
        
    }
    
    private func alertTheUser(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert);
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil);
        alert.addAction(ok);
        present(alert, animated: true, completion: nil);
    }
    
}  // class
