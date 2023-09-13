//
//  HomeInteractor.swift
//  Matinee
//
//  Created by Murat Akdal on 5.09.2023.
//

import Foundation

protocol HomeInteractorDelegate {
    func didReceiveData(movies: [[Movie]])
}

class HomeInteractor {
    var delegate : HomeInteractorDelegate?
    
    func fetchData() {
        
        var movieList: [[Movie]] = []
        APICaller.shared.getMoviesWithCompletion(partOfUrl: "/3/trending/movie/day?api_key=") { movies in
            movieList.append(movies)
            APICaller.shared.getMoviesWithCompletion(partOfUrl: "/3/movie/popular?api_key=") { movies in
                movieList.append(movies)
                APICaller.shared.getMoviesWithCompletion(partOfUrl: "/3/trending/tv/day?api_key=") { movies in
                    movieList.append(movies)
                    APICaller.shared.getMoviesWithCompletion(partOfUrl: "/3/movie/upcoming?api_key=") { movies in
                        movieList.append(movies)
                        APICaller.shared.getMoviesWithCompletion(partOfUrl: "/3/movie/top_rated?api_key=") { movies in
                            movieList.append(movies)
                            self.delegate?.didReceiveData(movies: movieList)
                        }
                    }
                }
            }
        }
    }
}
