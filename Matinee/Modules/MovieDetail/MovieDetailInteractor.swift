//
//  MovieDetailInteractor.swift
//  Matinee
//
//  Created by Murat Akdal on 5.09.2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

protocol MovieDetailInteractorDelegate {
    func didErrorOccured(_ error: Error)
}

class MovieDetailInteractor {
    
    var delegate : MovieDetailInteractorDelegate?
    
    func addWatchlistToFirebase(movieId: Int) {
        if let userId = Auth.auth().currentUser?.uid {
            let firestore = Firestore.firestore()
            
            
            let userWatchlistReference = firestore.collection("Watchlist").document("\(userId)")
            let movieWatchlistReference = userWatchlistReference.collection("Movies").document()
            
            movieWatchlistReference.setData(["MovieId" : movieId]) { error in
                if let error = error {
                    self.delegate?.didErrorOccured(error)
                } else {
//                    TODO: Add Watchlist button property change
                }
            }
        }
    }
}
