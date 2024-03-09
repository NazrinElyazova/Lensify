//
//  SheetController.swift
//  Lensify
//
//  Created by Nazrin on 03.03.24.
//

import UIKit
import Photos

protocol DetailProtocol {
    func saveImage(imageURL: String)
}

class SheetController: UIViewController, UISheetPresentationControllerDelegate {
    
    weak var delegate: SaveImageProtocol?
    var model = [GetTopics]()
    
    weak var controller: DetailController?
    var test: GetTopics?
    
    var urlsss: UrlsWallpapers?
    
    var delegate2: DetailProtocol?
    
    override var sheetPresentationController: UISheetPresentationController? {
        presentationController as? UISheetPresentationController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createSheet()
    }
    
    @IBAction func fullDownloadButton(_ sender: Any) {
        
//        presentSaveAndShareSheet()
//        delegate?.didTapDownloadButton(image: image)
//        presentSaveAndShareSheet(image: (controller?.detailPhoto.image ?? UIImage(named: "flagAZ"))!)
        delegate2?.saveImage(imageURL: test?.urls?.full ?? "")
//        loadImageAndPresentShareSheet(urls: urlsss?.full ?? "")
        self.dismiss(animated: true)

    }
    
    @IBAction func mediumDownloadButton(_ sender: Any) {
        
//        presentSaveAndShareSheet()
        delegate2?.saveImage(imageURL: test?.urls?.regular ?? "")
    }
    
    @IBAction func smallDownloadButton(_ sender: Any) {
        
//        presentSaveAndShareSheet()
        delegate2?.saveImage(imageURL: test?.urls?.small ?? "")
    }
    func presentSaveAndShareSheet(image: UIImage) {
            let saveandshare = UIActivityViewController(
                activityItems: [image],
                applicationActivities: nil)
            present(saveandshare, animated: true)
            print("nothing")
    }
    func loadImageAndPresentShareSheet(urls: UrlsWallpapers) {
        guard let url = URL(string: urls.full ?? "") else {
            print("Invalid URL")
            return
        }
        self.presentSaveAndShareSheet(image: UIImage(named: "Rainbow")!)

    }

    
    
//    func presentSaveAndShareSheet() {
//        if let image = UIImage(named: "flagAZ") {
//            let saveandshare = UIActivityViewController(
//                activityItems: [image],
//                applicationActivities: nil)
//            present(saveandshare, animated: true)
//        } else {
//            print("nothing")
//        }
//    }
//    
    
    func createSheet() {
        sheetPresentationController?.prefersGrabberVisible = true
        sheetPresentationController?.selectedDetentIdentifier = .medium
        sheetPresentationController?.delegate = self
        sheetPresentationController?.detents = [
            .medium(),
            .large()]
    }
}

