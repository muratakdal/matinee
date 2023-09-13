//
//  TabbarViewController.swift
//  Matinee
//
//  Created by Murat Akdal on 8.08.2023.
//

import UIKit

class TabbarViewController : UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabbarController()
    }
    
    private func setupTabbarController() {
        
        let home = HomeBuilder.make()
        let search = SearchBuilder.make()
        let watchList = UIStoryboard(name: "WatchList", bundle: nil).instantiateViewController(withIdentifier: "WatchListViewController") as! WatchListViewController
        let profile = UIStoryboard(name: "Profile", bundle: nil).instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController

        let vc1 = setupViewController(with: home, tabBarTitle: "Home", tabBarImage: UIImage(systemName: "house")!, tabBarSelectedImage: UIImage(systemName: "house.fill"))
        let vc2 = setupViewController(with: search, tabBarTitle: "Search", tabBarImage: UIImage(systemName: "magnifyingglass")!, tabBarSelectedImage: UIImage(systemName: "magnifyingglass.fill"))
        let vc3 = setupViewController(with: watchList, tabBarTitle: "Watch List", tabBarImage: UIImage(systemName: "checklist")!, tabBarSelectedImage: UIImage(systemName: "checklist.checked"))
        let vc4 = setupViewController(with: profile, tabBarTitle: "Profile", tabBarImage: UIImage(systemName: "person")!, tabBarSelectedImage: UIImage(systemName: "person.fill"))
        
        viewControllers = [vc1, vc2, vc3, vc4]
    }
    
    private func setupViewController(with viewController: UIViewController, tabBarTitle: String, tabBarImage: UIImage, tabBarSelectedImage: UIImage?) -> UINavigationController {
        viewController.tabBarItem = UITabBarItem(title: tabBarTitle, image: tabBarImage, selectedImage: tabBarSelectedImage)
        return UINavigationController(rootViewController: viewController)
    }
}
