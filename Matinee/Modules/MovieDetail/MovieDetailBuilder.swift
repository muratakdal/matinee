//
//  MovieDetailBuilder.swift
//  Matinee
//
//  Created by Murat Akdal on 19.09.2023.
//

import Foundation
import UIKit

class MovieDetailBuilder {
    static func make() -> MovieDetailViewController {
        let detail = UIStoryboard(name: "MovieDetail", bundle: nil).instantiateViewController(withIdentifier: "MovieDetailViewController") as! MovieDetailViewController
        
        let detailPresenter = MovieDetailPresenter()
        detailPresenter.delegate = detail
        
        let detailInteractor = MovieDetailInteractor()
        detailInteractor.delegate = detailPresenter
        
        detailPresenter.detailInteractor = detailInteractor
        
        detail.detailPresenter = detailPresenter
        
        return detail
    }
}
