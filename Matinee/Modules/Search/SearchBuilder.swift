//
//  SearchBuilder.swift
//  Matinee
//
//  Created by Murat Akdal on 6.09.2023.
//

import Foundation
import UIKit


class SearchBuilder {
    static func make() -> SearchViewController{
        let search = UIStoryboard(name: "Search", bundle: nil).instantiateViewController(withIdentifier: "SearchViewController") as! SearchViewController
        
        let searchPresenter = SearchPresenter()
        searchPresenter.delegate = search
        
        let searchInteractor = SearchInteractor()
        searchInteractor.delegate = searchPresenter
        
        let searchRouter = SearchRouter()
        searchRouter.viewController = search
        
        searchPresenter.searchInteractor = searchInteractor
        searchPresenter.searchRouter = searchRouter
        
        search.searchPresenter = searchPresenter
        
        return search
    }
}
