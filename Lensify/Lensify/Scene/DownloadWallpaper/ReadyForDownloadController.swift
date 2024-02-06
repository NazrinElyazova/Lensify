//
//  ReadyForDownloadController.swift
//  Lensify
//
//  Created by Nazrin on 04.02.24.
//

import UIKit
import Lottie

class ReadyForDownloadController: UIViewController {
    
    @IBOutlet weak var downloadLottie: LottieAnimationView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        readyForDownload()  
    }
    func readyForDownload() {
        DispatchQueue.main.async {
            self.downloadLottie.play()
            self.downloadLottie.loopMode = .loop
        }
    }
    @IBAction func clickAction(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "\(ListPhotoController.self)") as! ListPhotoController
        navigationController?.show(controller, sender: nil)
    }
}
