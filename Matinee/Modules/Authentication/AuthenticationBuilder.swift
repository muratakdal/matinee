//
//  AuthenticationBuilder.swift
//  Matinee
//
//  Created by Murat Akdal on 15.09.2023.
//

import Foundation
import UIKit

class AuthBuilder {
    static func make() -> AuthenticationViewController {
        let auth = UIStoryboard(name: "Authentication", bundle: nil).instantiateViewController(withIdentifier: "AuthenticationViewController") as! AuthenticationViewController
        
        let authPresenter = AuthPresenter()
        authPresenter.delegate = auth
        
        let authInteractor = AuthInteractor()
        authInteractor.delegate = authPresenter
        
        let authRouter = AuthRouter()
        authRouter.viewController = auth
        
        authPresenter.authInteractor = authInteractor
        authPresenter.authRouter = authRouter
        
        auth.authPresenter = authPresenter
        
        return auth
    }
}
