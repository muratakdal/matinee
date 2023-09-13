//
//  AuthenticationPresenter.swift
//  Matinee
//
//  Created by Murat Akdal on 12.09.2023.
//

import Foundation





class AuthPresenter : AuthInteractorDelegate {
    
    var authInteractor: AuthInteractor?
    
    func register(with emailText: String, with passwordText: String) {
        authInteractor?.register(emailText: emailText, passwordText: passwordText)
    }
    
    
    
    func delegateMethod() {
        
    }
    
    
}
