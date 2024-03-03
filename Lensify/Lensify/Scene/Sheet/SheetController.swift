//
//  SheetController.swift
//  Lensify
//
//  Created by Nazrin on 03.03.24.
//

import UIKit

class SheetController: UIViewController, UISheetPresentationControllerDelegate {

    override var sheetPresentationController: UISheetPresentationController? {
        presentationController as? UISheetPresentationController
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        sheetPresentationController?.prefersGrabberVisible = true
        sheetPresentationController?.selectedDetentIdentifier = .medium
        sheetPresentationController?.delegate = self
        sheetPresentationController?.detents = [
            .medium(),
            .large()]
    }
    @IBAction func fullDownloadButton(_ sender: Any) {
    }
    @IBAction func mediumDownloadButton(_ sender: Any) {
    }
    @IBAction func smallDownloadButton(_ sender: Any) {
    }
}
