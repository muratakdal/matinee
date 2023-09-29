//
//  SearchInteractor.swift
//  Matinee
//
//  Created by Murat Akdal on 1.09.2023.
//

import Foundation

protocol SearchInteractorDelegate {
    func didReceiveData(movies: [Movie])
}

class SearchInteractor : APICallerDelegate {
    var delegate : SearchInteractorDelegate?
    
    
    func getMovies(movies: [Movie]) {
        delegate?.didReceiveData(movies: movies)
    }

    func fetchData() {
        APICaller.shared.delegate = self
        APICaller.shared.getTrendingMoviesWithDelegate()
    }
    
    func searchMovie(with text: String) {
        APICaller.shared.delegate = self
        APICaller.shared.searchMovieWithCompletion(with: text) { movies in
            self.delegate?.didReceiveData(movies: movies)
        }
        APICaller.shared.searchTvWithCompletion(with: text) { movies in
            self.delegate?.didReceiveData(movies: movies)
        }
    }
}
