//
//  DetailController.swift
//  Lensify
//
//  Created by Nazrin on 02.03.24.
//

import UIKit
import FirebaseStorage
import FirebaseFirestore

class DetailController: UIViewController {
    
    private let manager = SaveFileManager.saveFile
    private let folderName = "detail_images"
    
    var viewModel: DetailViewModel?
    var item: GetTopics?
    var searchItem: SearchResult?
//    var image: UIImage?
    
    @IBOutlet weak var downloadButton: UIButton!
    @IBOutlet weak var detailPhoto: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewModel()
        configureExtensionButton(button: downloadButton)
        translateText()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        downloadDetailPhoto()
        getDetailImage()
    }
    
    // MARK: CREATE STORAGE REFERENCE
    func uploadPhoto() {
        let storageReference = Storage.storage().reference()
        
        // MARK: TURN IMAGE INTO DATA
        
        guard let image = detailPhoto.image else { print("detail photo nildir")
                  return
            }
        let imageData = image.jpegData(compressionQuality: 0.8)
                
        // MARK: SPECIFY THE FILE PATH AND NAME
        let path = "images/\(UUID().uuidString).jpg"
        let filePath = storageReference.child(path)
        
        // MARK: UPLOAD THAT DATA
        let uploadData = filePath.putData(imageData!, metadata: nil) {
            metadata, error in
            
            if error == nil && metadata != nil {
                let db = Firestore.firestore()
                db.collection("images").document().setData(["url":path])
            }
        }
        
        // MARK: SAVE A REFERENCE TO THE FILE IN FIRESTORE DB
        
    }
    
    @IBAction func addToFavButton(_ sender: Any) {
//        guard let image = detailPhoto.image else { print("detail photo nildir")
//            return
            //        }
            //        if manager.saveImage(image: image, imageName: item?.id ?? "", folderName: folderName) {
            //            print("Image added to favorites")
            //        } else {
            //            print("Failed to add image to favorites")
            //        }
            uploadPhoto()
        }

    
    @IBAction func downloadButtonTapped(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "\(SheetController.self)") as! SheetController
        controller.item = item
        controller.searchItem = searchItem
        self.present(controller, animated: true)
    }
    
    func configureViewModel() {
        viewModel?.getDetailPhoto()
        viewModel?.onError = {
            errorMessage in
            print("Errorrr var: \(errorMessage)")
        }
    }
    
    func downloadDetailPhoto() {
        detailPhoto?.loadImage(url: searchItem?.urls?.regular ?? "")
        detailPhoto.loadImage(url: item?.urls?.regular ?? "")
    }
    
    private func getDetailImage() {
        if let savedImage = manager.getImage(imageName: item?.id ?? "", folderName: folderName),
           let searchImage =
            manager.getImage(imageName: searchItem?.id ?? "", folderName: folderName) {
//            image = savedImage
//            image = searchImage
            print("image saved")
        }
    }
    
    func translateText() {
        downloadButton.setTitle("downloadButton".localize, for: .normal)
    }
}
