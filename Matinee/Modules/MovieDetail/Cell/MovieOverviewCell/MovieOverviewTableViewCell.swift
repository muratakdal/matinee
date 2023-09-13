//
//  MovieOverviewTableViewCell.swift
//  Matinee
//
//  Created by Murat Akdal on 5.09.2023.
//

import UIKit

class MovieOverviewTableViewCell: UITableViewCell {

    @IBOutlet weak var originalNameLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var voteAverageLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var releaseDateKeyLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
