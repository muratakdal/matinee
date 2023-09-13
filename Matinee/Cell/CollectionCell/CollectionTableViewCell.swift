//
//  CollectionTableViewCell.swift
//  Matinee
//
//  Created by Murat Akdal on 8.08.2023.
//

import UIKit
import Kingfisher

protocol CollectionTableViewCellDelegate {
    func selectedMovie(movie: Movie)
}

class CollectionTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    var movies: [Movie] = []
    
    var delegate: CollectionTableViewCellDelegate?
    
    weak var navigationController : UINavigationController?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.registerCollectionViewCells()
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func bind(movies: [Movie]) {
        self.movies = movies
        self.collectionView.reloadData()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    private func registerCollectionViewCells() {
        collectionView.register(UINib(nibName: "FilmCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "FilmCollectionViewCell")
    }
    
}

extension CollectionTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.movies.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FilmCollectionViewCell", for: indexPath) as? FilmCollectionViewCell else {
            fatalError()
        }
        
        let path = URL(string: "https://image.tmdb.org/t/p/original\(movies[indexPath.row].posterPath ?? "" )")
        cell.filmPosterImage.kf.setImage(with: path)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
//        let detailsPage = UIStoryboard.init(name: "MovieDetail", bundle: Bundle.main).instantiateViewController(withIdentifier: "MovieDetailViewController") as? MovieDetailViewController
//        detailsPage?.movie = searchPresenter.movies[indexPath.row]
//        self.navigationController?.pushViewController(detailsPage!, animated: true)
        
        let selectedMovie = movies[indexPath.row]
        delegate?.selectedMovie(movie: selectedMovie)
    }
}
