//
//  MovieDetailPresenter.swift
//  Matinee
//
//  Created by Murat Akdal on 5.09.2023.
//

import Foundation

protocol MovieDetailPresenterDelegate {
    func didErrorOccured(_ error: Error)
}

class MovieDetailPresenter : MovieDetailInteractorDelegate {
    
    var delegate : MovieDetailPresenterDelegate?
    var detailInteractor : MovieDetailInteractor?
    
    
    func addWatchlist(movieId: Int) {
        detailInteractor?.addWatchlistToFirebase(movieId: movieId)
    }
    
    func didErrorOccured(_ error: Error) {
        delegate?.didErrorOccured(error)
    }
}
