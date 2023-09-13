//
//  HomePresenter.swift
//  Matinee
//
//  Created by Murat Akdal on 23.08.2023.
//

import UIKit

protocol HomePresenterDelegate {
    func didReceiveData()
}

enum MovieListType: String {
    case trending = "Trending Movies"
    case popular = "Popular"
    case trendingTv = "Trending TV"
    case upcoming = "Upcoming Movies"
    case topRated = "Top Rated"
}

class HomePresenter : HomeInteractorDelegate {
   
    var delegate: HomePresenterDelegate?
    var homeInteractor: HomeInteractor?
    var homeRouter: HomeRouter?
    
    var movies: [[Movie]] = []
    
    let sectionTitles: [String] = [MovieListType.trending.rawValue,
                                   MovieListType.popular.rawValue,
                                   MovieListType.trendingTv.rawValue,
                                   MovieListType.upcoming.rawValue,
                                   MovieListType.topRated.rawValue]
    
   
    func fetchData() {
        homeInteractor?.delegate = self
        homeInteractor?.fetchData()
    }
    
    func didReceiveData(movies: [[Movie]]) {
        self.movies = movies
        delegate?.didReceiveData()
    }
    
    func goToMovieDetail(movie: Movie) {
        homeRouter?.movieDetail(movie: movie)
    }
}
