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
        let detailsPage = MovieDetailBuilder.make()
        detailsPage.movie = movie
        viewController?.navigationController?.pushViewController(detailsPage, animated: true)
    }
}
