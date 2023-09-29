//
//  WatchListViewController.swift
//  Matinee
//
//  Created by Murat Akdal on 9.08.2023.
//

import UIKit
import FirebaseAuth

class WatchListViewController: UIViewController, WatchListPresenterDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var watchlistPresenter : WatchListPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        registerTableViewCells()
        searchBarTextSetupUI()
        watchlistPresenter?.getWatchlistMovie()
    }
    
    private func registerTableViewCells() {
        tableView.register(UINib(nibName: "FilmPropertyTableViewCell", bundle: nil), forCellReuseIdentifier: "FilmPropertyTableViewCell")
    }
    
    private func searchBarTextSetupUI() {
        searchBar.searchTextField.textColor = .white
        searchBar.searchTextField.leftView?.tintColor = UIColor(named: "matineeSecondaryColor")
        searchBar.searchTextField.attributedPlaceholder = NSAttributedString(string: "Search in the watchlist.", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.7)])
    }
    
    func didReceiveData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func didErrorOccured(_ error: Error) {
        makeAlert(titleInput: "Error", messageInput: error.localizedDescription)
    }
    
    func makeAlert(titleInput: String, messageInput: String){
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Tamam", style: UIAlertAction.Style.default)
        alert.addAction(okButton)
        self.present(alert, animated: true)
    }
    
}

extension WatchListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FilmPropertyTableViewCell") as? FilmPropertyTableViewCell else {
            fatalError()
        }
        if let movie = watchlistPresenter?.watchList[indexPath.row] {
            let path = URL(string: "https://image.tmdb.org/t/p/original\(movie.posterPath ?? "")")
            cell.filmImageView.kf.setImage(with: path)
            if movie.title == nil {
                cell.filmNameLabel.text = movie.name
            } else {
                cell.filmNameLabel.text = movie.title
            }
            if let voteAverage = movie.voteAverage {
                cell.voteAverageLabel.text = String(format: "%.1f", voteAverage)
            }
            let inputFormatter = DateFormatter()
            inputFormatter.dateFormat = "YYYY-MM-dd"
            let outputFormatter = DateFormatter()
            outputFormatter.dateFormat = "MMM d, yyy"
            outputFormatter.locale = Locale(identifier: "en_EN")
            let date = inputFormatter.date(from: movie.releaseDate ?? "1970-01-01")
            let dateString = outputFormatter.string(from: date!)
            cell.releaseDateLabel.text = dateString
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return watchlistPresenter?.watchList.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let movie = watchlistPresenter?.watchList[indexPath.row] {
            watchlistPresenter?.goToMovieDetail(movie: movie)
        }
    }
    
}

extension WatchListViewController : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
    }
}
