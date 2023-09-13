//
//  AuthenticationInteractor.swift
//  Matinee
//
//  Created by Murat Akdal on 12.09.2023.
//

import Foundation
import FirebaseAuth

protocol AuthInteractorDelegate {
    func delegateMethod()
}

class AuthInteractor {
    var delegate : AuthInteractorDelegate?
    
    
    func register(emailText: String, passwordText: String) {
        
    }
    
    func login(emailText: String, passwordText: String) {
        if emailText != "" && passwordText != "" {
//            TODO: Firebase Auth.auth().signIn
        } else {
//            TODO: Error Alert
        }
    }
    
}
