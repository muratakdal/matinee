//
//  FilmCollectionViewCell.swift
//  Matinee
//
//  Created by Murat Akdal on 8.08.2023.
//

import UIKit

class FilmCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var filmPosterImage: UIImageView!
    
    var movie: Movie?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func bind(movie: Movie) {
        self.movie = movie
        let path = URL(string: "https://image.tmdb.org/t/p/original\(movie.posterPath ?? "")")
        self.filmPosterImage.kf.setImage(with: path)
    }

}
