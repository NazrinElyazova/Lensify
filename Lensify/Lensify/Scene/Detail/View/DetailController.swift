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
    //    private let folderName = "detail_images"
    
    var detail: UserInfo?
    
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
        //        getDetailImage()
    }
    
    func downloadDetailPhoto() {
        detailPhoto?.loadImage(url: searchItem?.urls?.regular ?? "")
        detailPhoto.loadImage(url: item?.urls?.regular ?? "")
    }
    
    func translateText() {
        downloadButton.setTitle("downloadButton".localize, for: .normal)
    }
    func configureViewModel() {
        viewModel?.getDetailPhoto()
        viewModel?.onError = {
            errorMessage in
            print("Errorrr var: \(errorMessage)")
        }
    }
    
    @IBAction func downloadButtonTapped(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "\(SheetController.self)") as! SheetController
        controller.item = item
        controller.searchItem = searchItem
        self.present(controller, animated: true)
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
        //            uploadPhoto()
        //        let path = "photo/\(detail?.favoritePhoto ?? "")"
        //        Storage.storage().reference().child(path).downloadURL { url, error in
        //
        //        }
        
        guard let favoritePhoto = detail?.favoritePhoto else {
               return
           }

           let path = "photo/\(favoritePhoto)"

           if let image = detailPhoto.image, let imageData = image.jpegData(compressionQuality: 0.8) {
               let storageRef = Storage.storage().reference().child(path)

               storageRef.putData(imageData, metadata: nil) { (metadata, error) in
                   if let error = error {
                       print("Error uploading image to Firebase Storage: \(error.localizedDescription)")
                       // Handle error (e.g., show an alert to the user)
                   } else {
                       print("Image uploaded to Firebase Storage")

                       let db = Firestore.firestore()
                       let favoritesCollection = db.collection("UserInfo")

                       let documentRef = favoritesCollection.document()

                       documentRef.setData([
                           "favoritePhoto": path,
                         
                       ]) { error in
                           if let error = error {
                               print("Error updating Firestore: \(error.localizedDescription)")
                           } else {
                               print("Firestore document updated")
                           }
                    }
                }
            }
                
                //    private func getDetailImage() {
                //        if let savedImage = manager.getImage(imageName: item?.id ?? "", folderName: folderName),
                //           let searchImage =
                //            manager.getImage(imageName: searchItem?.id ?? "", folderName: folderName) {
                ////            image = savedImage
                ////            image = searchImage
                //            print("image saved")
                //        }
                //    }
            }
        }
    }



