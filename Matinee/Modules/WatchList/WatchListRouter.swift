//
//  WatchListRouter.swift
//  Matinee
//
//  Created by Murat Akdal on 26.09.2023.
//

import Foundation
import UIKit

class WatchListRouter {
    var viewController: UIViewController?
    
    func movieDetail(movie: Movie) {
        let detailsPage = MovieDetailBuilder.make()
        detailsPage.movie = movie
        viewController?.navigationController?.pushViewController(detailsPage, animated: true)
    }
}
