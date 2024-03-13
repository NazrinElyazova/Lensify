//
//  SheetController.swift
//  Lensify
//
//  Created by Nazrin on 03.03.24.
//

import UIKit

class SheetController: UIViewController, UISheetPresentationControllerDelegate {
    
    var item: GetTopics?
    var searchItem: SearchResult?
    
    override var sheetPresentationController: UISheetPresentationController? {
        presentationController as? UISheetPresentationController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createSheet()
    }
    
    @IBAction func fullDownloadButton(_ sender: Any) {
        setURL(model: .getTopics, size: "full")
        setURL(model: .search, size: "full")
    }
    
    @IBAction func mediumDownloadButton(_ sender: Any) {
        setURL(model: .getTopics, size: "regular")
        setURL(model: .search, size: "regular")
    }
    
    @IBAction func smallDownloadButton(_ sender: Any) {
        setURL(model: .getTopics, size: "small")
        setURL(model: .search, size: "small")
    }
    
    enum ModelType {
        case getTopics
        case search
    }
    
    func setImageWithURL(_ url: String?, size: String) {
        guard let urlString = url, let imageURL = URL(string: urlString) else { return }
        
        guard let imageData = try? Data(contentsOf: imageURL),
              let image = UIImage(data: imageData) else { return }
        
        presentSaveAndShareSheet(image: image, url: urlString)
    }
    
    func setURL(model: ModelType, size: String) {
        let url: String?
        switch model {
        case .getTopics:
            url = size == "full" ? item?.urls?.full :
            size == "regular" ? item?.urls?.regular :
            item?.urls?.small
        case .search:
            url = size == "full" ? searchItem?.urls?.full :
            size == "regular" ? searchItem?.urls?.regular :
            searchItem?.urls?.small
        }
        setImageWithURL(url, size: size)
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

