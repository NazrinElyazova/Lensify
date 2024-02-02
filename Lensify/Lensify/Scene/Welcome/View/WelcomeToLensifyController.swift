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
        myLabel.text = "Welcome to Lensify"
        startWelcomeButton.layer.cornerRadius = 20
        
    }
    @IBAction func startActionButton(_ sender: UIButton) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "\(LaunchController.self)") as! LaunchController
        navigationController?.show(controller, sender: nil)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.purple.cgColor,  UIColor.systemPink.cgColor, UIColor.blue.cgColor]
        // purple, pink, white, blue, black,
        
        gradientLayer.startPoint = CGPoint(x: 0.7, y: 0.3)
        gradientLayer.endPoint = CGPoint(x: 0.2, y: 1.3)
        view.layer.addSublayer(gradientLayer)
        view.bringSubviewToFront(myLabel)
        view.bringSubviewToFront(startWelcomeButton)
        
        
    }
}
//   gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.5)
//gradientLayer.endPoint = CGPoint(x: 0, y: 1)


//  gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.5)
//gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)

//gradientLayer.startPoint = CGPoint(x: 0, y: 0)
//gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)

//orta yaxsisi
//gradientLayer.startPoint = CGPoint(x: 0.7, y: 0.3)
//gradientLayer.endPoint = CGPoint(x: 0.2, y: 0.8)

//best
//gradientLayer.startPoint = CGPoint(x: 0.7, y: 0.3)
//gradientLayer.endPoint = CGPoint(x: 0.2, y: 1.3)
