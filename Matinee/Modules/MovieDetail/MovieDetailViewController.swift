//
//  FilmDetailViewController.swift
//  Matinee
//
//  Created by Murat Akdal on 29.08.2023.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var movie: Movie?
    var isMovieSelected = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        registerTableViewCells()
        navBarSetUI()
    }
    
    private func registerTableViewCells(){
        self.tableView.register(UINib(nibName: "FilmBackdropTableViewCell", bundle: nil), forCellReuseIdentifier: "FilmBackdropTableViewCell")
        self.tableView.register(UINib(nibName: "MovieOverviewTableViewCell", bundle: nil), forCellReuseIdentifier: "MovieOverviewTableViewCell")
    }
    
    private func navBarSetUI() {
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.backItem?.title = "Home"
    }
    
    @objc func addWatchlistButtonClicked(_ sender: UIButton) {
        isMovieSelected = !isMovieSelected
        tableView.reloadData()
    }
    
}

extension MovieDetailViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "FilmBackdropTableViewCell", for: indexPath) as? FilmBackdropTableViewCell else {
                fatalError()//return UITableViewCell()
            }
            let path = URL(string: "https://image.tmdb.org/t/p/original\(movie?.backdropPath ?? "")")
            cell.filmBackdropImage.kf.setImage(with: path)
            if movie?.title == nil {
                cell.filmNameLabel.text = movie?.name
            } else {
                cell.filmNameLabel.text = movie?.title
            }
            cell.addWatchlistButton.addTarget(self, action: #selector(addWatchlistButtonClicked(_:)), for: .touchUpInside)
            if isMovieSelected {
                cell.addWatchlistButton.backgroundColor = .white
                cell.addWatchlistButton.tintColor = UIColor(named: "matineeSecondaryColor")
                cell.addWatchlistButton.layer.borderWidth = 3
                cell.addWatchlistButton.layer.borderColor = UIColor(named: "matineeSecondaryColor")?.cgColor
                cell.addWatchlistButton.setTitle("Added", for: .normal)
            } else {
                cell.addWatchlistButton.backgroundColor = UIColor(named: "matineeSecondaryColor")
                cell.addWatchlistButton.tintColor = .white
                cell.addWatchlistButton.setTitle("Add To Watchlist", for: .normal)
            }
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieOverviewTableViewCell", for: indexPath) as? MovieOverviewTableViewCell else {
                fatalError()//return UITableViewCell()
            }
            cell.overviewLabel.text = movie?.overview
            
            if let movie = movie, let voteAverage = movie.voteAverage {
                cell.voteAverageLabel.text = String(format: "%.1f", voteAverage)
//                cell.voteAverageLabel.text = String(describing: voteAverage)
            }
            
            if movie?.releaseDate == nil {
                cell.originalNameLabel.text = movie?.originalName
                cell.releaseDateLabel.isHidden = true
                cell.releaseDateKeyLabel.isHidden = true
            } else {
                cell.originalNameLabel.text = movie?.originalTitle
                cell.releaseDateKeyLabel.isHidden = false
                cell.releaseDateLabel.isHidden = false
                let inputFormatter = DateFormatter()
                inputFormatter.dateFormat = "YYYY-MM-dd"
                let outputFormatter = DateFormatter()
                outputFormatter.dateFormat = "MMM d, yyy"
                outputFormatter.locale = Locale(identifier: "en_EN")
                let date = inputFormatter.date(from: movie?.releaseDate ?? "1970-01-01")
                let dateString = outputFormatter.string(from: date!)
                cell.releaseDateLabel.text = dateString
            }
            return cell
        default:
            return UITableViewCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 280
        case 1:
            return 600
        default:
            return 280
        }
    }
}
