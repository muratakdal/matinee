//
//  AuthenticationPresenter.swift
//  Matinee
//
//  Created by Murat Akdal on 12.09.2023.
//

import Foundation

protocol AuthPresenterDelegate {
    func didErrorOccured(_ error: Error)
//    func didRegistrationSucceed(emailText: String, passwordText: String)
}



class AuthPresenter : AuthInteractorDelegate {
   
    var delegate: AuthPresenterDelegate?
    var authInteractor: AuthInteractor?
    var authRouter: AuthRouter?
    
    func register(with emailText: String, with passwordText: String) {
        authInteractor?.register(emailText: emailText, passwordText: passwordText)
    }
    
    func login(with emailText: String, with passwordText: String) {
        authInteractor?.login(emailText: emailText, passwordText: passwordText)
    }
    
    func didAuthSuccess() {
        authRouter?.pushToTabbar()
    }
    
    func didErrorOccured(_ error: Error) {
        delegate?.didErrorOccured(error)
    }
    
    
}
