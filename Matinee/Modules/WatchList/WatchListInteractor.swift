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
}

class WatchListInteractor {
    
    var delegate : WatchListInteractorDelegate?
    
    func getWatchlistFromFirebase(userId: String, completion: @escaping ([Int]) -> Void) {
        let firestore = Firestore.firestore()
        
        let userWatchlistReference = firestore.collection("Watchlist").document(userId)
        let movieWatchlistReference = userWatchlistReference.collection("Movies")
        movieWatchlistReference.getDocuments { snapshot, error in
            if let error = error {
                self.delegate?.didErrorOccured(error)
                completion([])
            } else {
                guard let documents = snapshot?.documents else {
                    print("No movie found")
                    completion([])
                    return
                }
                var watchList: [Int] = []
                
                for document in documents {
                    
                    if let movieId = document.get("MovieId") as? Int {
                        watchList.append(movieId)
                    }
                }
                completion(watchList)
            }
        }
    }
    
    func fetchMovieById(movieId: Int, completion: @escaping (Movie) -> Void) {
        APICaller.shared.fetchMovieById(movieId: movieId) { movie in
            if let movie = movie, movie.id != nil {
                completion(movie)
                return
            }
            APICaller.shared.fetchTvById(tvId: movieId) { movie in
                if let movie = movie, movie.id != nil {
                    completion(movie)
                }
            }
        }
    }
    
    func deleteMovieFromFirebase(movieId: Int) {
        if let userId = Auth.auth().currentUser?.uid {
            let firestore = Firestore.firestore()

            let userWatchlistReference = firestore.collection("Watchlist").document("\(userId)")
            let movieWatchlistReference = userWatchlistReference.collection("Movies").document("\(movieId)")
            
            movieWatchlistReference.delete()
        }
    }
}
