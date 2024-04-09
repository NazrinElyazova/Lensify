//
//  DetailController.swift
//  Lensify
//
//  Created by Nazrin on 02.03.24.
//

import UIKit

class DetailController: UIViewController {

    var viewModel: DetailViewModel?
    var item: GetTopics?
    var searchItem: SearchResult?
    var items: [Detail]?
    
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
    }
    
    @IBAction func downloadButtonTapped(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "\(SheetController.self)") as! SheetController
        controller.item = item
        controller.searchItem = searchItem
        self.present(controller, animated: true)
    }
    
    @IBAction func addToFavButton(_ sender: Any) {
        //MARK: CORE DATA
        let new = Detail(context: CoreDataManager.shared.context)
        if let imageData = detailPhoto.image?.jpegData(compressionQuality: 1.0) {
            new.detailPhoto = imageData
        }
        else {
            print("Error converting image to data")
        }
        CoreDataManager.shared.fetchImage { [weak self] item in
            guard let self else { return }
            items = item
            DispatchQueue.main.async { [weak self] in
                guard let self else { return }
            }
        }
        
        showLanguageAlert(title: "Congratulations", message: "You have already added image to your Favorites ❤️", okButton: UIAlertAction(title: "Ok", style: .default) {_ in
            let controller = self.storyboard?.instantiateViewController(withIdentifier: "\(FavoriteController.self)") as! FavoriteController
            self.navigationController?.pushViewController(controller, animated: true)
        }, cancelButton: UIAlertAction(title: "Cancel", style: .cancel))
    }
    
    func downloadDetailPhoto() {
        detailPhoto?.loadImage(url: searchItem?.urls?.full ?? "")
        detailPhoto.loadImage(url: item?.urls?.full ?? "")
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
}




