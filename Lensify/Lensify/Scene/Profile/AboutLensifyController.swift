//
//  AboutLensifyController.swift
//  Lensify
//
//  Created by Nazrin on 21.02.24.
//

import UIKit

class AboutLensifyController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.topItem?.title = ""
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
}
