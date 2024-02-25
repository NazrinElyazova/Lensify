//
//  LaunchController.swift
//  Lensify
//
//  Created by Nazrin on 14.01.24.
//

import UIKit
import Lottie

class LaunchController: UIViewController {
    
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var discoverLabel: UILabel!
    @IBOutlet weak var everyLabel: UILabel!
    @IBOutlet weak var lottieView: LottieAnimationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.topItem?.title = ""
        lottieAnimation()
    }
    @IBAction func continueButtonAction(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "\(LoginController.self)") as! LoginController
        navigationController?.show(controller, sender: nil)
    }
    func lottieAnimation() {
        DispatchQueue.main.async {
            self.lottieView.play()
            self.lottieView.loopMode = .loop
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        translateText()
    }
    func translateText() {
        everyLabel.text = "everyWay".localize
        discoverLabel.text = "discover".localize
        continueButton.setTitle("continue".localize, for: .normal)
    }
}
