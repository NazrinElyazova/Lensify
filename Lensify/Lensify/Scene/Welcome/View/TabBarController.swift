//
//  TabBarController.swift
//  Lensify
//
//  Created by Nazrin on 14.01.24.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideTitle()
        tabBar.backgroundColor = .black
        tabBar.barTintColor = UIColor.black
    }
}
