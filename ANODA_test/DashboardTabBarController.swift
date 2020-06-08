//
//  DashboardTabBarController.swift
//  ANODA_test
//
//  Created by md760 on 05.06.2020.
//  Copyright © 2020 md760. All rights reserved.
//

import UIKit

final class DashboardTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //MARK: - HomeViewController
        let homeVC = HomeViewController().navigated()
        let homeItem = UITabBarItem(title: "", image: #imageLiteral(resourceName: "outline_home_black_18dp"), selectedImage: #imageLiteral(resourceName: "baseline_home_black_18dp"))
        homeVC.tabBarItem = homeItem
        
        //MARK: - SearchViewController
        let searchVC = UIViewController()
        let searchItem = UITabBarItem(title: "", image: #imageLiteral(resourceName: "baseline_search_black_18dp-1"), selectedImage: #imageLiteral(resourceName: "baseline_search_black_18dp-1"))
        searchVC.tabBarItem = searchItem
        
        //MARK: - AddNewViewController
        let addPhotoVC = UIViewController()
        let addPhotoItem = UITabBarItem(title: "", image: #imageLiteral(resourceName: "outline_add_box_black_18dp"), selectedImage: #imageLiteral(resourceName: "baseline_add_box_black_18dp"))
        addPhotoVC.tabBarItem = addPhotoItem
        
        //MARK: - FavouritesViewController
        let favouritesVC = UIViewController()
        let favouritesItem = UITabBarItem(title: "", image: #imageLiteral(resourceName: "baseline_favorite_border_black_18dp"), selectedImage: #imageLiteral(resourceName: "baseline_favorite_black_18dp"))
        favouritesVC.tabBarItem = favouritesItem
        
        //MARK: - ProfileViewController
        let profileVC = UIViewController()
        let profileItem = UITabBarItem(title: "", image: #imageLiteral(resourceName: "outline_menu_black_18dp"), selectedImage: #imageLiteral(resourceName: "outline_menu_black_18dp"))
        profileVC.tabBarItem = profileItem
        
        self.viewControllers = [homeVC, searchVC, addPhotoVC, favouritesVC, profileVC]
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        self.tabBar.tintColor = .black
    }
}
