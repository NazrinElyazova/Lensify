//
//  SheetController.swift
//  Lensify
//
//  Created by Nazrin on 03.03.24.
//

import UIKit

class SheetController: UIViewController, UISheetPresentationControllerDelegate {
    
    var model = [GetTopics]()
    weak var delegate: SaveImageProtocol?
    
    var controller: DetailController?
    
    var test: GetTopics?
    
    override var sheetPresentationController: UISheetPresentationController? {
        presentationController as? UISheetPresentationController
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        createSheet()
        
    }
    // Dependency injection for DetailController
    init(detailController: DetailController) {
        self.controller = detailController
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    @IBAction func fullDownloadButton(_ sender: Any) {
        
        load(resolution: "full")
    }
    @IBAction func mediumDownloadButton(_ sender: Any) {
        
        load(resolution: "medium")
        
    }
    @IBAction func smallDownloadButton(_ sender: Any) {
        
        load(resolution: "small")
        
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
    //        case "full":
    //            guard let image = controller?.detailPhoto.image else {return}
    //            delegate?.didTapDownloadButton(image: image)
    //            controller?.detailPhoto.loadImage(url: test?.urls?.full ?? "")
    //
    //        case "medium":
    //            guard let image = controller?.detailPhoto.image else {return}
    //            delegate?.didTapDownloadButton(image: image)
    //            controller?.detailPhoto.loadImage(url: test?.urls?.regular ?? "")
    //
    //        case "small":
    //            guard let image = controller?.detailPhoto.image else {return}
    //            delegate?.didTapDownloadButton(image: image)
    //            controller?.detailPhoto.loadImage(url: test?.urls?.small ?? "")
    //
    //        default:
    //            break
    //        }
    //    }
    func load(resolution: String) {
    
        switch resolution {
        case "full":
            if let image = controller?.detailPhoto.image {
                delegate?.didTapDownloadButton(image: image)
                controller?.detailPhoto.loadImage(url: test?.urls?.full ?? "")
            } else {
                print("Error: Full image is nil.")
            }
            
        case "medium":
            if let image = controller?.detailPhoto.image {
                delegate?.didTapDownloadButton(image: image)
                controller?.detailPhoto.loadImage(url: test?.urls?.regular ?? "")
            } else {
                print("Error: Medium image is nil.")
            }
            
        case "small":
            if let image = controller?.detailPhoto.image {
                delegate?.didTapDownloadButton(image: image)
                controller?.detailPhoto.loadImage(url: test?.urls?.small ?? "")
            } else {
                print("Error: Small image is nil.")
            }
            
        default:
            print("Error: Unknown resolution.")
        }
    }
}
