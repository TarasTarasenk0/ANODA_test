//
//  DashboardTabBarController.swift
//  ANODA_test
//
//  Created by md760 on 05.06.2020.
//  Copyright © 2020 md760. All rights reserved.
//

import UIKit

class DashboardTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    override func viewWillAppear(_ animated: Bool) {
          super.viewWillAppear(animated)
          let homeVC = HomeViewController()
        let icon1 = UITabBarItem(tabBarSystemItem: .resent, tag: 0)
          homeVC.tabBarItem = icon1
          let controllers = [homeVC]  //array of the root view controllers displayed by the tab bar interface
          self.viewControllers = controllers
      }

}
