//
//  TermsAndConditionsController.swift
//  Lensify
//
//  Created by Nazrin on 20.02.24.
//

import UIKit

class TermsAndConditionsController: UIViewController {

    @IBOutlet weak var termsConditionsLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.navigationController?.navigationBar.topItem?.title = ""
    }
    override func viewWillAppear(_ animated: Bool) {
        termsConditionsLabel.text = "termsText".localize
    }
}
