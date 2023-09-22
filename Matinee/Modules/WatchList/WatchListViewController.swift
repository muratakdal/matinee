//
//  WatchListViewController.swift
//  Matinee
//
//  Created by Murat Akdal on 9.08.2023.
//

import UIKit

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
    }
    
    private func registerTableViewCells() {
        tableView.register(UINib(nibName: "FilmPropertyTableViewCell", bundle: nil), forCellReuseIdentifier: "FilmPropertyTableViewCell")
    }
    
    private func searchBarTextSetupUI() {
        searchBar.searchTextField.textColor = .white
        searchBar.searchTextField.leftView?.tintColor = UIColor(named: "matineeSecondaryColor")
        searchBar.searchTextField.attributedPlaceholder = NSAttributedString(string: "Search in the watchlist.", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.7)])
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
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 12
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
}
