//
//  DetailController.swift
//  Lensify
//
//  Created by Nazrin on 02.03.24.
//

import UIKit

class DetailController: UIViewController {
    
    private let manager = SaveFileManager.saveFile
    
    var viewModel: DetailViewModel?
    var item: GetTopics?
    var searchItem: SearchResult?
    
    var image: UIImage? = nil

    private let folderName = "detail_images"
    var fav = [GetTopics]()
    @IBOutlet weak var downloadButton: UIButton!
    @IBOutlet weak var detailPhoto: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureViewModel()
        configureExtensionButton(button: downloadButton)
        translateText()
        downloaddd()
        getDetailPhoto()
    }
    func downloaddd() {
        detailPhoto.loadImage(url: item?.urls?.regular ?? "")
    }
    private func getDetailPhoto() {
        if let savedImage = manager.getImge(imageName: item?.id ?? "", folderName: folderName) {
            image = savedImage
            print("image saveddd")
        }
    }
    
    func translateText() {
        downloadButton.setTitle("downloadButton".localize, for: .normal)
    }
    
    @IBAction func addToFavButton(_ sender: Any) {
        guard let image = detailPhoto.image else { print("sorryy")
            return}

        manager.saveImage(image: image, imageName: item?.id ?? "", folderName: folderName)
        

        showLanguageAlert(title: "Great", message: "You have already added the image to Favorities", okButton: UIAlertAction(title: "Ok", style: .default, handler: { _ in
            if let favoriteController = self.storyboard?.instantiateViewController(withIdentifier: "FavoriteController") as? FavoriteController {
//                favoriteController.onUpdate = { items in
//                    self.fav = items
//                    favoriteController.collection.reloadData()
//                }
                self.navigationController?.pushViewController(favoriteController, animated: true)
            }
        }), cancelButton: UIAlertAction(title: "Cancel", style: .cancel))
    }
    
    @IBAction func downloadButtonTapped(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "\(SheetController.self)") as! SheetController
        controller.item = item
        self.present(controller, animated: true)
    }
    
    func configureViewModel() {
        viewModel?.getDetailPhoto()
        viewModel?.onError = {
            errorMessage in
            print("Errorrr var: \(errorMessage)")
        }
    }
}
