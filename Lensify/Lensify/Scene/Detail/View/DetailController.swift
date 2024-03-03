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

    
    @IBOutlet weak var detailPhoto: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewModel()
        detailPhoto.loadImage(url: item?.urls?.small ?? "")
    }
   
    @IBAction func addFavoriteButton(_ sender: Any) {
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
