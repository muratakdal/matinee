//
//  APICaller.swift
//  Matinee
//
//  Created by Murat Akdal on 11.08.2023.
//

import Foundation

protocol APICallerDelegate {
    func getMovies(movies: [Movie])
}

struct Constants {
    static let API_KEY = "22a911354622cef33cde0747e1e8bec5"
    static let baseURL = "https://api.themoviedb.org"
}

enum APIError {
    case failedToGetData
}

class APICaller {
    var delegate: APICallerDelegate?
    static let shared = APICaller()
    
    private init() { }

    func getMoviesWithCompletion(partOfUrl: String, completion: @escaping ([Movie]) -> ()) {
        guard let url = URL(string: "\(Constants.baseURL)\(partOfUrl)\(Constants.API_KEY)") else {return}
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let results = try JSONDecoder().decode(MovieResponse.self, from: data)
                //self.delegate?.getMovies(movies: results.results)
                completion(results.results)
            } catch {
                //self.delegate?.getMovies(movies: [])
                completion([])
                print(error)
            }
        }
        task.resume()
    }
    
    func searchMovieWithCompletion(with query: String, completion: @escaping ([Movie]) -> ()) {
        
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {return}
        guard let url = URL(string: "\(Constants.baseURL)/3/search/movie?api_key=\(Constants.API_KEY)&query=\(query)") else {return}
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(MovieResponse.self, from: data)
                completion(results.results)
            } catch {
                completion([])
                print(error)
            }
        }
        task.resume()
    }
    
    func fetchWatchlistMovies() {
        
    }
    
//   MARK: page: Int (getTrendingMoviesWithDelegate metodunun alacağı parametre)
    func getTrendingMoviesWithDelegate() {
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/movie/day?api_key=\(Constants.API_KEY)") else {return}
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }

            do {
                let results = try JSONDecoder().decode(MovieResponse.self, from: data)
                self.delegate?.getMovies(movies: results.results)
            } catch {
                self.delegate?.getMovies(movies: [])
                print(error)
            }
        }
        task.resume()
    }
    
    func getPopularMoviesWithDelegate() {
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/popular?api_key=\(Constants.API_KEY)") else {return}
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let results = try JSONDecoder().decode(MovieResponse.self, from: data)
                self.delegate?.getMovies(movies: results.results)
            } catch {
                self.delegate?.getMovies(movies: [])
                print(error)
            }
        }
        task.resume()
    }
    
    func getTrendingTvWithDelegate() {
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/tv/day?api_key=\(Constants.API_KEY)") else {return}
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let results = try JSONDecoder().decode(MovieResponse.self, from: data)
                self.delegate?.getMovies(movies: results.results)
            } catch {
                self.delegate?.getMovies(movies: [])
                print(error)
            }
        }
        task.resume()
    }
    
    func getUpcomingWithDelegate() {
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/upcoming?api_key=\(Constants.API_KEY)") else {return}
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let results = try JSONDecoder().decode(MovieResponse.self, from: data)
                self.delegate?.getMovies(movies: results.results)
            } catch {
                self.delegate?.getMovies(movies: [])
                print(error)
            }
        }
        task.resume()
    }
    
    func getTopRatedWithDelegate() {
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/top_rated?api_key=\(Constants.API_KEY)") else {return}
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let results = try JSONDecoder().decode(MovieResponse.self, from: data)
                self.delegate?.getMovies(movies: results.results)
            } catch {
                self.delegate?.getMovies(movies: [])
                print(error)
            }
        }
        task.resume()
    }
}
