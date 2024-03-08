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
    
    var controller: DetailController?
    var test: GetTopics?
    
    var delegate2: DetailProtocol?
    
    override var sheetPresentationController: UISheetPresentationController? {
        presentationController as? UISheetPresentationController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createSheet()
    }
    
    @IBAction func fullDownloadButton(_ sender: Any) {
        
        presentSaveAndShareSheet()
        delegate2?.saveImage(imageURL: test?.urls?.full ?? "")
        
    }
    
    @IBAction func mediumDownloadButton(_ sender: Any) {
        
        presentSaveAndShareSheet()
        delegate2?.saveImage(imageURL: test?.urls?.regular ?? "")
        
    }
    
    @IBAction func smallDownloadButton(_ sender: Any) {
        
        presentSaveAndShareSheet()
        delegate2?.saveImage(imageURL: test?.urls?.small ?? "")
        
        guard let image = controller?.detailPhoto.image else { return }
        
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(<#T##@objc method#>), nil)
        
    }
    
    @objc func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            let ac = UIAlertController(title: "Save erro", message: <#T##String?#>, preferredStyle: <#T##UIAlertController.Style#>)
        }
    }
//    func presentSaveAndShareSheet() {
//        if let image = test?.urls?.full {
//            
//            let saveandshare = UIActivityViewController(
//                activityItems: [image],
//                applicationActivities: nil)
//            present(saveandshare, animated: true)
//        } else {
//            print("nothing")
//
//        }
//    }
//  
    func presentSaveAndShareSheet() {
        if let test = test, let image = test.urls?.full {
            let saveandshare = UIActivityViewController(
                activityItems: [image],
                applicationActivities: nil)
            present(saveandshare, animated: true)
        } else {
            print("Unable to retrieve image for sharing.")
        }
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
