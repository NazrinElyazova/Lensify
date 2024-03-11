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
    var searchItem: SearchResult?
    
    override var sheetPresentationController: UISheetPresentationController? {
        presentationController as? UISheetPresentationController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createSheet()
    }
    
    func setFullURLGetTopicsModel() {
        guard let fullURL = item?.urls?.full,
              let full = URL(string: fullURL)
        else { print("fullUrl nildir")
            return }
        
        guard let imageData = try? Data(contentsOf: full),
              let image = UIImage(data: imageData) else { return }
        presentSaveAndShareSheet(image: image, url: item?.urls?.full ?? "")
        
    }
    
    func setFullURLSearchModel() {
        guard let searchFull = searchItem?.urls?.full,
              let search = URL(string: searchFull) else {
            print("searchfull nildir")
            return }
        
        guard let fullImage = try? Data(contentsOf: search),
              let photo = UIImage(data: fullImage) else {
            print("search image nildir")
            return }
        presentSaveAndShareSheet(image: photo, url: searchItem?.urls?.full ?? "")
    }
    
    func setRegularURLGetTopicsModel() {
        guard let regularURL = item?.urls?.regular,
              let regular = URL(string: regularURL)
        else { print("Regular url nildir")
            return }
        
        guard let imageData = try? Data(contentsOf: regular),
              let image = UIImage(data: imageData) else { return }
        presentSaveAndShareSheet(image: image, url: item?.urls?.regular ?? "")
        
    }
    
    func setRegularURLSearchModel() {
        guard let searchRegular = searchItem?.urls?.regular,
              let search = URL(string: searchRegular) else {
            print("searchfull nildir")
            return }
        
        guard let regularImage = try? Data(contentsOf: search),
              let photo = UIImage(data: regularImage) else {
            print("search regular image nildir")
            return }
        presentSaveAndShareSheet(image: photo, url: searchItem?.urls?.regular ?? "")
    }
    func setSmallURLGetTopicsModel() {
        guard let smallURL = item?.urls?.small,
              let small = URL(string: smallURL)
        else { print("Small url nildir")
            return }
        
        guard let imageData = try? Data(contentsOf: small),
              let image = UIImage(data: imageData) else { return }
        presentSaveAndShareSheet(image: image, url: item?.urls?.small ?? "")
        
    }
    
    func setSmallURLSearchModel() {
        guard let searchSmall = searchItem?.urls?.small,
              let smallSearch = URL(string: searchSmall) else {
            print("searchfull nildir")
            return }
        
        guard let regularImage = try? Data(contentsOf: smallSearch),
              let photo = UIImage(data: regularImage) else {
            print("search regular image nildir")
            return }
        presentSaveAndShareSheet(image: photo, url: searchItem?.urls?.small ?? "")
    }
    
    @IBAction func fullDownloadButton(_ sender: Any) {
        setFullURLGetTopicsModel()
        setFullURLSearchModel()
    }
    
    @IBAction func mediumDownloadButton(_ sender: Any) {
        setRegularURLGetTopicsModel()
        setRegularURLSearchModel()
    }
    
    @IBAction func smallDownloadButton(_ sender: Any) {
        setSmallURLGetTopicsModel()
        setSmallURLGetTopicsModel()
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

