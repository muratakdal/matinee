//
//  WatchListBuilder.swift
//  Matinee
//
//  Created by Murat Akdal on 19.09.2023.
//

import Foundation
import UIKit

class WatchListBuilder {
    static func make() -> WatchListViewController {
        let watchlist = UIStoryboard(name: "WatchList", bundle: nil).instantiateViewController(withIdentifier: "WatchListViewController") as! WatchListViewController
        
        let watchlistPresenter = WatchListPresenter()
        watchlistPresenter.delegate = watchlist
        
        let watchlistInteractor = WatchListInteractor()
        watchlistInteractor.delegate = watchlistPresenter
        
        watchlistPresenter.watchlistInteractor = watchlistInteractor
        
        watchlist.watchlistPresenter = watchlistPresenter
        
        return watchlist
    }
}
