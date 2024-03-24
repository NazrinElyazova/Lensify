//
//  DetailScreenCoordinator.swift
//  Lensify
//
//  Created by Nazrin on 23.03.24.
//

import Foundation
import UIKit

protocol Coordinator {
    var navigatonController: UINavigationController { get set }
    func start()
}

class DetailScreenCoordinator: Coordinator {
    var navigatonController: UINavigationController
    var id: String
    
    var result: SearchResult?
    var homeResult: GetTopics?
    
    let viewModel = SearchViewModel()

    init(navigatonController: UINavigationController, id: String, result: SearchResult) {
        self.navigatonController = navigatonController
        self.id = id
        self.result = result
    }
    
    func start() {
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "\(DetailController.self)") as! DetailController
        controller.viewModel = DetailViewModel(id: id)
        controller.searchItem = result
        navigatonController.show(controller, sender: nil)
    }
}
