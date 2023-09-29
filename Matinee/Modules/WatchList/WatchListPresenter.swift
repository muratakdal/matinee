//
//  WatchListPresenter.swift
//  Matinee
//
//  Created by Murat Akdal on 5.09.2023.
//

import Foundation
import FirebaseAuth

protocol WatchListPresenterDelegate {
    func didErrorOccured(_ error: Error)
    func didReceiveData()
}

class WatchListPresenter : WatchListInteractorDelegate {
    
    var delegate : WatchListPresenterDelegate?
    var watchlistInteractor : WatchListInteractor?
    var watchlistRouter: WatchListRouter?
    
    var watchList : [Movie] = []
    
    func didErrorOccured(_ error: Error) {
        delegate?.didErrorOccured(error)
    }
    
    func getWatchlistMovie() {
        self.watchList = []
        guard let currentUserID = Auth.auth().currentUser?.uid else {return}
        watchlistInteractor?.getWatchlistFromFirebase(userId: currentUserID, completion: { watchList in
            for movieId in watchList {
                self.watchlistInteractor?.fetchMovieById(movieId: movieId, completion: { movie in
                    if self.watchList.first(where: { m in
                        m.id ?? 0 == movie.id ?? 0
                    }) == nil {
                        self.watchList.append(movie)
                        
                        if watchList.count == self.watchList.count {
                            self.delegate?.didReceiveData()
                        }
                    }
                })
            }
        })
    }
    
    func goToMovieDetail(movie: Movie) {
        watchlistRouter?.movieDetail(movie: movie)
    }
    
    func deleteMovieFromFirebase(movieId: Int){
        watchlistInteractor?.deleteMovieFromFirebase(movieId: movieId)
    }
    
}
