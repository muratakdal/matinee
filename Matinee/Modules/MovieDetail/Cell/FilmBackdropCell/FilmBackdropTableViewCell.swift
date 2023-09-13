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
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
