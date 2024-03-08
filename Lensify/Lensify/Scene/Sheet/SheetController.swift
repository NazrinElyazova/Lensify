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
        
//        delegate?.didTapDownloadButton(image: controller?.detailPhoto.image ?? UIImage())
        
        delegate2?.saveImage(imageURL: test?.urls?.full ?? "")
        
    }
    
    @IBAction func mediumDownloadButton(_ sender: Any) {
        
//        delegate?.didTapDownloadButton(image: controller?.detailPhoto.image ?? UIImage())
        
        delegate2?.saveImage(imageURL: test?.urls?.regular ?? "")
        
    }
    
    @IBAction func smallDownloadButton(_ sender: Any) {
        
        delegate?.didTapDownloadButton(image: controller?.detailPhoto.image ?? UIImage())
        delegate2?.saveImage(imageURL: test?.urls?.small ?? "")
        
    }
    func presentSaveAndShareSheet(image: UIImage) {
        let saveandshare = UIActivityViewController(
            activityItems: [image],
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
