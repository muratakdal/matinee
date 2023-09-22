//
//  AuthenticationInteractor.swift
//  Matinee
//
//  Created by Murat Akdal on 12.09.2023.
//

import Foundation
import FirebaseAuth

protocol AuthInteractorDelegate {
    func didErrorOccured(_ error: Error)
    func didAuthSuccess()
//    func didRegistrationSucceed(emailText: String, passwordText: String)
}

class AuthInteractor {
    var delegate : AuthInteractorDelegate?
    
    
    func register(emailText: String, passwordText: String) {
        Auth.auth().createUser(withEmail: emailText, password: passwordText) { result, error in
            if let error = error {
                self.delegate?.didErrorOccured(error)
            } else {
                self.delegate?.didAuthSuccess()
            }
        }
    }
    
    func login(emailText: String, passwordText: String) {
        Auth.auth().signIn(withEmail: emailText, password: passwordText) { result, error in
            if let error = error {
                self.delegate?.didErrorOccured(error)
            } else {
                self.delegate?.didAuthSuccess()
            }
        }
    }
    
}
