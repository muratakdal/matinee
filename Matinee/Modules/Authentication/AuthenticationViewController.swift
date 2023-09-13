//
//  AuthorizationViewController.swift
//  Matinee
//
//  Created by Murat Akdal on 8.08.2023.
//

import Foundation
import UIKit

class AuthenticationViewController : UIViewController {
    
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    
    var authPresenter: AuthPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    @IBAction func logInButtonClicked(_ sender: Any) {
        
    }
    
    
    @IBAction func signUpButtonClicked(_ sender: Any) {
        if emailTF.text != "" && passwordTF.text != "" {
            authPresenter?.register(with: emailTF.text!, with: passwordTF.text!)
        } else {
            makeAlert(titleInput: "Caution", messageInput: "Field cant not be blank.")
        }
    }
    
    func makeAlert(titleInput: String, messageInput: String){
            let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: .alert)
            let okButton = UIAlertAction(title: "Tamam", style: UIAlertAction.Style.default)
            alert.addAction(okButton)
            self.present(alert, animated: true)
        }
    
}
