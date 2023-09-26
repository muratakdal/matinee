//
//  ProfileViewController.swift
//  Matinee
//
//  Created by Murat Akdal on 8.08.2023.
//

import Foundation
import UIKit
import FirebaseAuth

class ProfileViewController : UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        registerTableViewCells()
    }
    
    private func registerTableViewCells() {
        tableView.register(UINib(nibName: "UserSettingsTableViewCell", bundle: nil), forCellReuseIdentifier: "UserSettingsTableViewCell")
    }
}

extension ProfileViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserSettingsTableViewCell") as? UserSettingsTableViewCell else {
            fatalError()
        }
        cell.userMailLabel.text = Auth.auth().currentUser?.email
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollView.isScrollEnabled = false
    }
}
