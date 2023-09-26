//
//  FilmPropertyTableViewCell.swift
//  Matinee
//
//  Created by Murat Akdal on 28.08.2023.
//

import UIKit

class FilmPropertyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var filmImageView: UIImageView!
    @IBOutlet weak var filmNameLabel: UILabel!
    @IBOutlet weak var voteAverageLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    
    var movie: Movie?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
//    func bind(movie: Movie) {
//        self.movie = movie
//        let path = URL(string: "https://image.tmdb.org/t/p/original\(movie.posterPath ?? "")")
//        self.filmImageView.kf.setImage(with: path)
//
//    }
    
}
