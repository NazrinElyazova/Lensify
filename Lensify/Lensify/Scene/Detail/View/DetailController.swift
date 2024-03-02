//
//  DetailController.swift
//  Lensify
//
//  Created by Nazrin on 02.03.24.
//

import UIKit

class DetailController: UIViewController {
    
    var viewModel: HomeViewModel?
    var id: String
    
    init(movieId: String) {
        self.id = movieId
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBOutlet weak var detailPhoto: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewModel()
//        showDetailPhoto(data: viewModel?.detail)
    }
    func showDetailPhoto(id: String) {
//        detailPhoto.loadImage(url: data.coverPhoto?.urls?.small ?? "")
        let coordinator = HomeCoordinator(navigationController: navigationController ?? UINavigationController(), coordinatorID: id)
        coordinator.start()
    }
    
    @IBAction func downloadButtonTapped(_ sender: Any) {
        
    }
    func configureViewModel() {
        viewModel?.getTopics()
        viewModel?.onError = {
            errorMessage in
            print("Errorrr var: \(errorMessage)")
        }
        viewModel?.onSuccess = {
            //            self.collection.reloadData()
        }
    }
}
extension DetailController: HomeProtocol {
    func detailPhotoSelection(detailID: String) {
        showDetailPhoto(id: detailID)
    }
}
