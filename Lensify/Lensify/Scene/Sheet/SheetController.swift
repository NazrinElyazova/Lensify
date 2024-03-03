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
    
    override var sheetPresentationController: UISheetPresentationController? {
        presentationController as? UISheetPresentationController
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        createSheet()
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
    func load(resolution: String) {
//        var test: GetTopics?
        var url: String = ""
        switch resolution {
        case "full":
//            controller?.detailPhoto.loadImage(url: test?.urls?.full ?? "")
            guard let image = controller?.detailPhoto.image else {return}
            delegate?.didTapDownloadButton(image: image)
            url = "https://images.unsplash.com/photo-1662516108520-e5a1171dfa43?ixlib=rb-4.0.3&q=85&fm=jpg&crop=entropy&cs=srgb"
           case "medium":
            guard let image = controller?.detailPhoto.image else {return}
            delegate?.didTapDownloadButton(image: image)
//            controller?.detailPhoto.loadImage(url: test?.urls?.regular ?? "")
            url = "https://images.unsplash.com/photo-1662516108520-e5a1171dfa43?ixlib=rb-4.0.3"
           case "small":
            guard let image = controller?.detailPhoto.image else {return}
            delegate?.didTapDownloadButton(image: image)
//            controller?.detailPhoto.loadImage(url: test?.urls?.small ?? "")
            url = "https://images.unsplash.com/photo-1662516108520-e5a1171dfa43?ixlib=rb-4.0.3&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=400&fit=max"
           default:
               break
           }
    }
}

