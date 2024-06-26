//
//  ReadyForDownloadController.swift
//  Lensify
//
//  Created by Nazrin on 04.02.24.
//

import UIKit
import Lottie

class ReadyForDownloadController: UIViewController {
    
    @IBOutlet weak var clickTapped: UIButton!
    @IBOutlet weak var clickForItLabel: UILabel!
    @IBOutlet weak var readyForLabel: UILabel!
    @IBOutlet weak var downloadLottie: LottieAnimationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        translateText()
        readyForDownload()
        hideTitle()
        configureExtensionButton(button: clickTapped)
    }
    
    @IBAction func clickAction(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "\(TabBarController.self)") as! TabBarController
        controller.modalTransitionStyle = .crossDissolve
        controller.modalPresentationStyle = .fullScreen
        present(controller, animated: true)
    }
    
    func translateText() {
        clickTapped.setTitle("click".localize, for: .normal)
        readyForLabel.text = "readyFor".localize
        clickForItLabel.text = "clickForIt".localize
    }
    
    func readyForDownload() {
        navigationController?.navigationBar.isHidden = true
        DispatchQueue.main.async {
            self.downloadLottie.play()
            self.downloadLottie.loopMode = .loop
        }
    }
}
