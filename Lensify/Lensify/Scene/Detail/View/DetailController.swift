//
//  DetailController.swift
//  Lensify
//
//  Created by Nazrin on 02.03.24.
//

import UIKit

class DetailController: UIViewController {
    
    private let manager = SaveFileManager.saveFile
    private let folderName = "detail_images"
    
    var viewModel: DetailViewModel?
    var item: GetTopics?
    var searchItem: SearchResult?
    var image: UIImage?
    
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
    
    @IBAction func addToFavButton(_ sender: Any) {
        
        guard let image = detailPhoto.image else { return
        }
        if manager.saveImage(image: image, imageName: item?.id ?? "", folderName: folderName) {
            print("Image added to favorites")
        } else {
            print("Failed to add image to favorites")
        }
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
    
    func downloadDetailPhoto() {
        detailPhoto.loadImage(url: item?.urls?.regular ?? "")
    }
    
    private func getDetailImage() {
        if let savedImage = manager.getImage(imageName: item?.id ?? "", folderName: folderName) {
            image = savedImage
            print("image saved")
        }
    }
    
    func translateText() {
        downloadButton.setTitle("downloadButton".localize, for: .normal)
    }
}
