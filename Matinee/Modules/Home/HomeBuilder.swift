//
//  HomeBuilder.swift
//  Matinee
//
//  Created by Murat Akdal on 8.09.2023.
//

import Foundation
import UIKit

class HomeBuilder {
    static func make() -> HomeViewController {
        let home = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        
        let homePresenter = HomePresenter()
        homePresenter.delegate = home
        
        let homeInteractor = HomeInteractor()
        homeInteractor.delegate = homePresenter
        
        let homeRouter = HomeRouter()
        homeRouter.viewController = home
        
        homePresenter.homeInteractor = homeInteractor
        homePresenter.homeRouter = homeRouter
        
        home.homePresenter = homePresenter
        
        return home
    }
}
