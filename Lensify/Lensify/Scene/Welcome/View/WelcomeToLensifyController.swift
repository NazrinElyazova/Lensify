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
        configureExtensionButton(button: startWelcomeButton)
        configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        translateTitle()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setGradientColor()
        view.bringSubviewToFront(myLabel)
        view.bringSubviewToFront(startWelcomeButton)
    }
    
    @IBAction func startActionButton(_ sender: UIButton) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "\(LaunchController.self)") as! LaunchController
        controller.modalTransitionStyle = .flipHorizontal
        controller.modalPresentationStyle = .fullScreen
        present(controller, animated: true)
        
    }
    
    func configureUI() {
        myLabel.adjustsFontSizeToFitWidth = true
        startWelcomeButton.clipsToBounds = true
        startWelcomeButton.layer.cornerRadius = 20
    }
    
    func translateTitle() {
        myLabel.text = "welcomeLabel".localize
        startWelcomeButton.setTitle("welcomeButton".localize, for: .normal)
    }
}


