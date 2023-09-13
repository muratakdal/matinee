//
//  SearchViewController.swift
//  Matinee
//
//  Created by Murat Akdal on 8.08.2023.
//

import Foundation
import UIKit
import Kingfisher

class SearchViewController : UIViewController, SearchPresenterDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var searchPresenter: SearchPresenter?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        registerCollectionViewCells()
        searchPresenter?.fetchData()
        searchTextFieldSetupUI()
    }
    
    private func registerCollectionViewCells() {
        collectionView.register(UINib(nibName: "FilmCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "FilmCollectionViewCell")
    }
    
    func didReceiveData() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    private func searchTextFieldSetupUI() {
        searchBar.searchTextField.textColor = .white
        searchBar.searchTextField.leftView?.tintColor = UIColor(named: "matineeSecondaryColor")
        searchBar.searchTextField.attributedPlaceholder = NSAttributedString(string: "Type a movie name.", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.7)])
    }
}

extension SearchViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FilmCollectionViewCell", for: indexPath) as? FilmCollectionViewCell else {
            fatalError()
        }
        

        cell.bind(movie: searchPresenter!.movies[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchPresenter?.movies.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        if let movie = searchPresenter?.movies[indexPath.row] {
            searchPresenter?.goToMovieDetail(movie: movie)
        }
    }
}

extension SearchViewController : UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        !searchText.isEmpty && searchText.count > 3 ? searchPresenter?.searchMovie(with: searchText) : searchPresenter?.fetchData()
    }
    
}
