//
//  HomeViewController.swift
//  Matinee
//
//  Created by Murat Akdal on 8.08.2023.
//

import UIKit

class HomeViewController : UIViewController, HomePresenterDelegate, CollectionTableViewCellDelegate {
   
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var homePresenter: HomePresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        registerTableViewCells()
        configureNavbar()
        homePresenter?.fetchData()
        let headerView = HeroHeaderUIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 450))
        tableView.tableHeaderView = headerView
        
    }
    
    private func configureNavbar() {
        
        var image = UIImage(named: "matineeLogoWhite")
        image = image?.withRenderingMode(.alwaysOriginal)
        
        let matineeLogoBarButton = UIBarButtonItem(image: image, style: .done, target: self, action: nil)
        matineeLogoBarButton.customView?.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        navigationItem.leftBarButtonItem = matineeLogoBarButton
        
        
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "person.fill"), style: .done, target: self, action: nil),
            UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .done, target: self, action: nil),
            
        ]
        navigationController?.navigationBar.backgroundColor = UIColor(named: "matineePrimaryColor")
        navigationController?.navigationBar.tintColor = .white
        navigationItem.title = "matinée"
        
    }
    
    func registerTableViewCells(){
        self.tableView.register(UINib(nibName: "CollectionTableViewCell", bundle: nil), forCellReuseIdentifier: "CollectionTableViewCell")
    }
    
    func didReceiveData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension HomeViewController : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return homePresenter?.movies.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CollectionTableViewCell", for: indexPath) as? CollectionTableViewCell else {
            fatalError()//return UITableViewCell()
        }
        cell.delegate = self
        if let movies = homePresenter?.movies[indexPath.section] {
            cell.bind(movies: movies)
        }
        return cell
    }
    
   
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor(named: "matineePrimaryColor")
        
        let titleLabel = UILabel(frame: CGRect(x: 15, y: 5, width: tableView.bounds.size.width, height: 30))
        titleLabel.text = homePresenter?.sectionTitles[section]
        titleLabel.textColor = .white
        headerView.addSubview(titleLabel)
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func selectedMovie(movie: Movie) {
        homePresenter?.goToMovieDetail(movie: movie)
    }
    
    
}
