//
//  WatchListViewController.swift
//  Matinee
//
//  Created by Murat Akdal on 9.08.2023.
//

import UIKit

class WatchListViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
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
