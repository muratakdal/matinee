//
//  WatchListInteractor.swift
//  Matinee
//
//  Created by Murat Akdal on 5.09.2023.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

protocol WatchListInteractorDelegate {
    func didErrorOccured(_ error: Error)
    func didReceiveData()
}

class WatchListInteractor {
    
    var delegate : WatchListInteractorDelegate?
    
    func getWatchlistFromFirebase(userId: String, completion: @escaping (String?) -> Void) {
        let firestore = Firestore.firestore()
        
        let userWatchlistReference = firestore.collection("Watchlist").document(userId)
        let movieWatchlistReference = userWatchlistReference.collection("Movies").document("MovieId")
        
        movieWatchlistReference.getDocument { document, error in
            if let error = error {
                self.delegate?.didErrorOccured(error)
                completion(nil)
            } else {
                if let documentData = document?.data(), let movieId = documentData["movieId"] as? String {
                    
                    completion(movieId)
                    print(movieId)
                } else {
                    completion(nil)
                }
            }
        }
    }
}
