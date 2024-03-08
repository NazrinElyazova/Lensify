//
//  DetailController.swift
//  Lensify
//
//  Created by Nazrin on 02.03.24.
//

import UIKit

class DetailController: UIViewController {
    
    let manager = SaveFileManager()
    
    var viewModel: DetailViewModel?
    var item: GetTopics?
    var searchItem: SearchResult?
    var fav = [GetTopics]()
    var onUpdate: (([GetTopics]) -> Void)?
    var test = [GetTopics]()
    
    
    var homeCont: HomeController?
    
    weak var delegate: SaveImageProtocol?
    var delegate2: DetailProtocol?
    
    @IBOutlet weak var downloadButton: UIButton!
    @IBOutlet weak var detailPhoto: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewModel()
        detailPhoto.loadImage(url: item?.urls?.regular ?? "")
        detailPhoto.loadImage(url: searchItem?.urls?.small ?? "")
        configureExtensionButton(button: downloadButton)
        translateText()
    }
    
    func translateText() {
        downloadButton.setTitle("downloadButton".localize, for: .normal)
    }
    
    func saveFile() {
        manager.readJsonFile { bookmarkItems in
            self.fav = bookmarkItems
        }
        
        fav.append(contentsOf: test)
        manager.writeJsonData(items: fav)
        onUpdate?(fav)
    }
    
    @IBAction func addToFavButton(_ sender: Any) {
        
        self.saveFile()
        
        showLanguageAlert(title: "Great", message: "You have already added the image to Favorities", okButton: UIAlertAction(title: "Ok", style: .default, handler: { _ in
            if let favoriteController = self.storyboard?.instantiateViewController(withIdentifier: "FavoriteController") as? FavoriteController {
                favoriteController.onUpdate = { items in
                    self.fav = items
                    favoriteController.collection.reloadData()
                }
                self.navigationController?.pushViewController(favoriteController, animated: true)
            }
        }), cancelButton: UIAlertAction(title: "Cancel", style: .cancel))
    }
    
    @IBAction func downloadButtonTapped(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "\(SheetController.self)") as! SheetController
        controller.delegate = self
        controller.delegate2 = self
        self.present(controller, animated: true)
    }
    
    func configureViewModel() {
        viewModel?.getDetailPhoto()
        viewModel?.onError = {
            errorMessage in
            print("Errorrr var: \(errorMessage)")
        }
    }
    
        func presentSaveAndShareSheet(image: UIImage) {
            let saveandshare = UIActivityViewController(
                activityItems: [image],
                applicationActivities: nil)
            present(saveandshare, animated: true)
        }

//    func save2(image: String) {
//            let saveandshare = UIActivityViewController(
//                activityItems: [image],
//                applicationActivities: nil)
//            present(saveandshare, animated: true)
//        }
    func save2(image: String) {
//        detailPhoto.loadImage(url: item?.urls?.full ?? "")
//        detailPhoto.loadImage(url: item?.urls?.regular ?? "")
        detailPhoto.loadImage(url: item?.urls?.small ?? "")

    }
}

extension DetailController: SaveImageProtocol {
    func didTapDownloadButton(image: UIImage) {
        
//        guard let image = detailPhoto.image else {return}
//        delegate?.didTapDownloadButton(image: image)
        presentSaveAndShareSheet(image: image)

    }
}

extension DetailController: DetailProtocol {
    func saveImage(imageURL: String) {
        save2(image: imageURL)
    }
}
