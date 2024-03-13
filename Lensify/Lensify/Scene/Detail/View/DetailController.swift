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
    var star = [GetTopics]()
    
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
        let test = GetTopics(id: item?.id, urls: item?.urls)
        star.append(test)
        manager.writeJsonData(items: star)
        
        showLanguageAlert(title: "Congratulations", message: "You have already added image to your Favorites ❤️", okButton: UIAlertAction(title: "Ok", style: .default) {_ in 
            let controller = self.storyboard?.instantiateViewController(withIdentifier: "\(FavoriteController.self)") as! FavoriteController
            self.navigationController?.pushViewController(controller, animated: true)
        }, cancelButton: UIAlertAction(title: "Cancel", style: .cancel))
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
}




