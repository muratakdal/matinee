//
//  SearchRouter.swift
//  Matinee
//
//  Created by Murat Akdal on 6.09.2023.
//

import Foundation
import UIKit


class SearchRouter {
    var viewController: UIViewController?
    
    func movieDetail(movie: Movie) {
        let detailsPage = UIStoryboard.init(name: "MovieDetail", bundle: Bundle.main).instantiateViewController(withIdentifier: "MovieDetailViewController") as? MovieDetailViewController
        detailsPage?.movie = movie
        viewController?.navigationController?.pushViewController(detailsPage!, animated: true)
    }
}
