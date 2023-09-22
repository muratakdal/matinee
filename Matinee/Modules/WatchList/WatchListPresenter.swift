//
//  WatchListPresenter.swift
//  Matinee
//
//  Created by Murat Akdal on 5.09.2023.
//

import Foundation

protocol WatchListPresenterDelegate {
    func didErrorOccured(_ error: Error)
}

class WatchListPresenter : WatchListInteractorDelegate {
    
    var delegate : WatchListPresenterDelegate?
    var watchlistInteractor : WatchListInteractor?
    
    
    func didErrorOccured(_ error: Error) {
        delegate?.didErrorOccured(error)
    }
    
    func getWatchlistMovie(userId: String) {
//        TODO: interactor.getWatchlist 
    }
    
    func didReceiveData() {
        
    }
    
}
