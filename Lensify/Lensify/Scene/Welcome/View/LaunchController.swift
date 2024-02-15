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
        
        self.navigationController?.navigationBar.topItem?.title = ""
        lottieAnimation()
    }
    @IBAction func continueButtonAction(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "\(TabBarController.self)") as! TabBarController
        navigationController?.show(controller, sender: nil)
    }
    func lottieAnimation() {
        DispatchQueue.main.async {
            self.lottieView.play()
            self.lottieView.loopMode = .loop
        }
    }
}
