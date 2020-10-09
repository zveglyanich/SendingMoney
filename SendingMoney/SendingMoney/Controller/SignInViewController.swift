//
//  ViewController.swift
//  SendingMoney
//
//  Created by Павел Звеглянич on 04.10.2020.
//  Copyright © 2020 Pavel Zveglyanich. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func signInButton(_ sender: UIButton) { //check correct login/password and signIn
        if loginTextField.text == UserSettings.userKeyChainModel.login && loginTextField.text?.isEmpty != true {
            if passwordTextField.text == UserSettings.userKeyChainModel.password && passwordTextField.text?.isEmpty != true {
                performSegue(withIdentifier: "signInId", sender: sender)
            } else {
                alertController(messageToExistAlertController: "Password for account isn't correct")
            }
        } else {
            alertController(messageToExistAlertController: "This account doesn't exist")
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.navigationItem.title = "Sending money"
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        passwordTextField.isSecureTextEntry = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loginTextField.text = UserSettings.userKeyChainModel.login // refresh login
        passwordTextField.text = UserSettings.userKeyChainModel.password // refresh password
    }
    
    private func alertController(messageToExistAlertController message: String) { //alertControler for check correct login or password
        let alert = UIAlertController(title: "Attention", message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default)
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
    
}

