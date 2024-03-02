//
//  Coordinator.swift
//  Lensify
//
//  Created by Nazrin on 02.03.24.
//

import Foundation
import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    
    func start()
}
