//
//  ColorController.swift
//  Lensify
//
//  Created by Nazrin on 13.01.24.
//

import UIKit

class WelcomeToLensifyController: UIViewController {
    
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var startWelcomeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideTitle()
        myLabel.adjustsFontSizeToFitWidth = true
        configureExtensionButton(button: startWelcomeButton)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        translateTitle()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.purple.cgColor,  UIColor.systemPink.cgColor, UIColor.blue.cgColor, UIColor.yellow.cgColor, UIColor.red.cgColor, UIColor.green.cgColor]
        
        gradientLayer.startPoint = CGPoint(x: 0.7, y: 0.3)
        gradientLayer.endPoint = CGPoint(x: 0.2, y: 1.3)
        
        view.layer.addSublayer(gradientLayer)
        view.bringSubviewToFront(myLabel)
        view.bringSubviewToFront(startWelcomeButton)
    }
    
    @IBAction func startActionButton(_ sender: UIButton) {
        
        let controller = storyboard?.instantiateViewController(withIdentifier: "\(LaunchController.self)") as! LaunchController
        navigationController?.show(controller, sender: nil)
    }
    
    func translateTitle() {
        myLabel.text = "welcomeLabel".localize
        startWelcomeButton.setTitle("welcomeButton".localize, for: .normal)
    }
}


