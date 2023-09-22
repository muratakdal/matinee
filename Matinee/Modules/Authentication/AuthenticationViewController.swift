//
//  AuthorizationViewController.swift
//  Matinee
//
//  Created by Murat Akdal on 8.08.2023.
//

import Foundation
import UIKit

class AuthenticationViewController : UIViewController, AuthPresenterDelegate {
    
    
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    
    var authPresenter: AuthPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func logInButtonClicked(_ sender: Any) {
        if emailTF.text != "" && passwordTF.text != "" {
            authPresenter?.login(with: emailTF.text!, with: passwordTF.text!)
        } else {
            makeAlert(titleInput: "Error", messageInput: "Can not be blank field.")
        }
    }
    
    
    @IBAction func signUpButtonClicked(_ sender: Any) {
        if emailTF.text != "" && passwordTF.text != "" {
            authPresenter?.register(with: emailTF.text!, with: passwordTF.text!)
        } else {
            makeAlert(titleInput: "Error", messageInput: "Can not be blank field.")
        }
    }
    
    func didErrorOccured(_ error: Error) {
        makeAlert(titleInput: "Caution", messageInput: error.localizedDescription)
    }
    
    func makeAlert(titleInput: String, messageInput: String){
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Tamam", style: UIAlertAction.Style.default)
        alert.addAction(okButton)
        self.present(alert, animated: true)
    }
    
}
