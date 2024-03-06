//
//  HomeCoordinator.swift
//  Lensify
//
//  Created by Nazrin on 02.03.24.
//

import Foundation
import UIKit

class HomeCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var coordinatorID: String
    
    init(navigationController: UINavigationController, coordinatorID: String) {
        self.navigationController = navigationController
        self.coordinatorID = coordinatorID
    }
    
    func start() {
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "\(DetailController.self)") as! DetailController
        navigationController.show(controller, sender: nil)
    }
}
