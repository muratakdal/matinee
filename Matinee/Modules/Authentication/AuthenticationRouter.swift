//
//  AuthenticationRouter.swift
//  Matinee
//
//  Created by Murat Akdal on 12.09.2023.
//

import Foundation
import UIKit

class AuthRouter {
    var viewController: UIViewController?
    
    func pushToTabbar() {
        let tabbarViewController = TabbarViewController()
        viewController?.navigationController?.pushViewController(tabbarViewController, animated: true)
    }
}
