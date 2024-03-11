//
//  SheetController.swift
//  Lensify
//
//  Created by Nazrin on 03.03.24.
//

import UIKit

class SheetController: UIViewController, UISheetPresentationControllerDelegate {
    
    var model = [GetTopics]()
    var item: GetTopics?
 
    override var sheetPresentationController: UISheetPresentationController? {
        presentationController as? UISheetPresentationController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createSheet()
    }
    
    @IBAction func fullDownloadButton(_ sender: Any) {
        guard let fullURL = item?.urls?.full,
              let full = URL(string: fullURL) else {
            return
        }
        guard let imageData = try? Data(contentsOf: full),
              let image = UIImage(data: imageData) else {
            return
        }
        presentSaveAndShareSheet(image: image, url: item?.urls?.full ?? "")
    }
    
    @IBAction func mediumDownloadButton(_ sender: Any) {
        guard let regularURLString = item?.urls?.regular,
              let regularURL = URL(string: regularURLString) else {
            return
        }
        guard let imageData = try? Data(contentsOf: regularURL),
              let image = UIImage(data: imageData) else {
            return
        }
        presentSaveAndShareSheet(image: image, url: item?.urls?.regular ?? "")
    }
    
    @IBAction func smallDownloadButton(_ sender: Any) {
        guard let smallURL = item?.urls?.small,
              let small = URL(string: smallURL) else {
            return
        }
        guard let imageData = try? Data(contentsOf: small),
              let image = UIImage(data: imageData) else {
            return
        }
        presentSaveAndShareSheet(image: image, url: item?.urls?.small ?? "")
    }
    
    func presentSaveAndShareSheet(image: UIImage, url: String) {
        let saveandshare = UIActivityViewController(
            activityItems: [
                image, url
            ],
            applicationActivities: nil)
        present(saveandshare, animated: true)
    }
    
    func createSheet() {
        sheetPresentationController?.prefersGrabberVisible = true
        sheetPresentationController?.selectedDetentIdentifier = .medium
        sheetPresentationController?.delegate = self
        sheetPresentationController?.detents = [
            .medium(),
            .large()]
    }
}

