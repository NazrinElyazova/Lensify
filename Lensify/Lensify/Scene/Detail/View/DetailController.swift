//
//  DetailController.swift
//  Lensify
//
//  Created by Nazrin on 02.03.24.
//

import UIKit
import CoreData

protocol BookmarkDelegate {
    func addButtonAction(index: Int)
}

class DetailController: UIViewController {
    
    var viewModel: DetailViewModel?
    
//    let manager = SaveFileManager()

    var item: GetTopics?
    var homeController: HomeController?
    
    var fav = [Favorite]()
    var delegate: BookmarkDelegate?
    
    var test = [Favorite]()
    
    @IBOutlet weak var detailPhoto: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewModel()
        detailPhoto.loadImage(url: item?.urls?.regular ?? "")
        
//        manager.readJsonFile { favItems in
//            self.fav = favItems
//        }
    }
    func callback() {
//        let controller = storyboard?.instantiateViewController(withIdentifier: "DetailController") as! DetailController
//        controller.onUpdate = { item in
//            self.model = item
//            self.collection.reloadData()
//        }
        if let detailController = storyboard?.instantiateViewController(withIdentifier: "FavoriteController") as? FavoriteController {
                 detailController.onUpdate = { item in
                     self.fav = item
                     detailController.collection.reloadData()
                 }
                 navigationController?.pushViewController(detailController, animated: true)
             }
    }
    
    @IBAction func addToFavButton(_ sender: Any) {
        let fav2 = Favorite(image: "\(String(describing: detailPhoto.image))")
        fav.append(fav2)
//        manager.writeJsonData(items: fav)

//        manager.readJsonFile { bookmarkItems in
//            self.fav = bookmarkItems
////            collection.reloadData()
//            
//        }
        delegate?.addButtonAction(index: 1)
        print("saved")
    }

    @IBAction func downloadButtonTapped(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "\(SheetController.self)") as! SheetController
        controller.delegate = self
        self.present(controller, animated: true)
    }
    func configureViewModel() {
        viewModel?.getDetailPhoto()
        viewModel?.onError = {
            errorMessage in
            print("Errorrr var: \(errorMessage)")
        }
    }
    func save(image: UIImage) {
        func presentSaveAndShareSheet(image: UIImage) {
            let saveandshare = UIActivityViewController(
                activityItems: [image],
                applicationActivities: nil)
            present(saveandshare, animated: true)
        }
    }
    
}
extension DetailController: SaveImageProtocol {
    
    func didTapDownloadButton(image: UIImage) {
           
        save(image: image)
    }
}
