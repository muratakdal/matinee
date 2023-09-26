//
//  UserSettingsTableViewCell.swift
//  Matinee
//
//  Created by Murat Akdal on 22.09.2023.
//

import UIKit

class UserSettingsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userMailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    private func setupUI() {
        userImageView.layer.masksToBounds = true
        userImageView.layer.borderWidth = 2
        userImageView.layer.borderColor = UIColor(named: "matineeSecondaryColor")?.cgColor
        userImageView.layer.cornerRadius = userImageView.frame.size.height / 2
    }
    
}
