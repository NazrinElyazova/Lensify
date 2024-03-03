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

//    var img = UIImage()
    
    @IBOutlet weak var detailPhoto: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewModel()
        detailPhoto.loadImage(url: item?.urls?.small ?? "")
    }
    
    func showDetailPhoto(id: String) {
//        detailPhoto.loadImage(url: data.coverPhoto?.urls?.small ?? "")
        let coordinator = HomeCoordinator(navigationController: navigationController ?? UINavigationController(), coordinatorID: id)
        coordinator.start()
    }
    
    @IBAction func downloadButtonTapped(_ sender: Any) {
        
    }
    func configureViewModel() {
        viewModel?.getDetailPhoto()
        viewModel?.onError = {
            errorMessage in
            print("Errorrr var: \(errorMessage)")
        }
//        viewModel?.onSuccess = {  image in
//                    self.detailPhoto.image = image
//        }
    }
}
//extension DetailController: HomeProtocol {
//    func detailPhotoSelection(detailID: String) {
//        
//        showDetailPhoto(id: detailID)
//    }
//}
