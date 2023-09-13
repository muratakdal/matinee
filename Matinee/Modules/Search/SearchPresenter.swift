//
//  SearchPresenter.swift
//  Matinee
//
//  Created by Murat Akdal on 29.08.2023.
//

import UIKit

protocol SearchPresenterDelegate {
    func didReceiveData()
}

class SearchPresenter : SearchInteractorDelegate {
    
    var delegate : SearchPresenterDelegate?
    var searchInteractor: SearchInteractor?
    var searchRouter: SearchRouter?
    
    var movies: [Movie] = []
    
    func fetchData() {
        searchInteractor?.fetchData()
    }
    
    func searchMovie(with text: String) {
        searchInteractor?.searchMovie(with: text)
    }
    
    func didReceiveData(movies: [Movie]) {
        self.movies = movies
        delegate?.didReceiveData()
    }
    
    func goToMovieDetail(movie: Movie) {
        searchRouter?.movieDetail(movie: movie)
    }
    
}
