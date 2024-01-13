//
//  LaunchController.swift
//  Lensify
//
//  Created by Nazrin on 14.01.24.
//

import UIKit
import Lottie

class LaunchController: UIViewController {

    @IBOutlet weak var discoverLabel: UILabel!
    @IBOutlet weak var everyLabel: UILabel!
    
    @IBOutlet weak var lottieView: LottieAnimationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lottieView.play()
        lottieView.loopMode = .loop
    }

}
