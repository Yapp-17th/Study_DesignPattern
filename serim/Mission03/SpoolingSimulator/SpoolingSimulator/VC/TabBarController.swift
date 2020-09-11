//
//  TabBarController.swift
//  SpoolingSimulator
//
//  Created by 바보세림이 on 2020/09/09.
//  Copyright © 2020 serim. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTabBar()
    }
    
    private func setUpTabBar() {
        let firstVC = DocumentViewController()
        firstVC.tabBarItem.image = UIImage(systemName: "doc.text")
        let secondVC = PrintViewController()
        secondVC.tabBarItem.image = UIImage(systemName: "printer")
        viewControllers = [firstVC, secondVC]
    }

}
