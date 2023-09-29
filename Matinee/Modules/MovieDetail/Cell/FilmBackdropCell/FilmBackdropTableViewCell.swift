//
//  FilmBackdropTableViewCell.swift
//  Matinee
//
//  Created by Murat Akdal on 31.08.2023.
//

import UIKit

class FilmBackdropTableViewCell: UITableViewCell {

    @IBOutlet weak var filmBackdropImage: UIImageView!
    @IBOutlet weak var filmNameLabel: UILabel!
    @IBOutlet weak var addWatchlistButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func addWatchlistSelected() {
        addWatchlistButton.backgroundColor = .white
        addWatchlistButton.tintColor = UIColor(named: "matineeSecondaryColor")
        addWatchlistButton.layer.borderWidth = 3
        addWatchlistButton.layer.borderColor = UIColor(named: "matineeSecondaryColor")?.cgColor
        addWatchlistButton.setTitle("Added", for: .normal)
    }
    
    func addWatchlistNotSelected() {
        addWatchlistButton.backgroundColor = UIColor(named: "matineeSecondaryColor")
        addWatchlistButton.tintColor = .white
        addWatchlistButton.setTitle("Add To Watchlist", for: .normal)
    }
    
}
