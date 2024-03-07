//
//  SheetController.swift
//  Lensify
//
//  Created by Nazrin on 03.03.24.
//

import UIKit


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
        
        controller?.load(resolution: "full")
        
    }
    
    @IBAction func mediumDownloadButton(_ sender: Any) {
        
        controller?.load(resolution: "medium")
    }
    
    @IBAction func smallDownloadButton(_ sender: Any) {
        
        controller?.load(resolution: "small")
        
    }
    
    func createSheet() {
        sheetPresentationController?.prefersGrabberVisible = true
        sheetPresentationController?.selectedDetentIdentifier = .medium
        sheetPresentationController?.delegate = self
        sheetPresentationController?.detents = [
            .medium(),
            .large()]
    }

//    func load(resolution: String) {
//    
//        switch resolution {
//            
//        case "full":
////            if let image =  controller?.detailPhoto.image {
////                delegate?.didTapDownloadButton(image: image)
////                controller?.detailPhoto.loadImage(url: test?.urls?.full ?? "")
////            } else {
////                print("Error: Full image is nil.")
////            }
//            delegate2?.saveImage(imageURL: test?.urls?.full ?? "")
//            
//        case "medium":
////            if let image = controller?.detailPhoto.image {
////                delegate?.didTapDownloadButton(image: image)
//////                controller?.detailPhoto.loadImage(url: test?.urls?.regular ?? "")
////            } else {
////                print("Error: Medium image is nil.")
////            }
//            delegate2?.saveImage(imageURL: test?.urls?.regular ?? "")
//
//            
//        case "small":
////            if let image = controller?.detailPhoto.image {
////                delegate?.didTapDownloadButton(image: image)
////                controller?.detailPhoto.loadImage(url: test?.urls?.small ?? "")
////            } else {
////                print("Error: Small image is nil.")
////            }
//            delegate2?.saveImage(imageURL: test?.urls?.small ?? "")
//
//            
//        default:
//            print("Error: Unknown resolution.")
//        }
//    }
}
