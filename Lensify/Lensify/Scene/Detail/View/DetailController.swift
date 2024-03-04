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
    var homeController: HomeController?
    
    var favoriteButtonItem: UIBarButtonItem?
       var isFavorite: Bool = false


    var coreModel = CoreDataViewModel()
    
    @IBOutlet weak var detailPhoto: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewModel()
        detailPhoto.loadImage(url: item?.urls?.regular ?? "")
        
        var favoriteImage: UIImage {
            return (UIImage(systemName: "heart" + (isFavorite ? ".fill" : "")) ?? UIImage())
        }
        favoriteButtonItem = UIBarButtonItem(image: favoriteImage,
                                             style: .plain,
                                             target: self,
                                             action: #selector(toggleFavorite))
        
        navigationItem.rightBarButtonItem = favoriteButtonItem
    }
    @objc private func toggleFavorite()
        {
            isFavorite = !isFavorite
            print("heart")
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
        coreModel.fetchData()

        coreModel.completion = {
           //print something
            print("comp success")
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
