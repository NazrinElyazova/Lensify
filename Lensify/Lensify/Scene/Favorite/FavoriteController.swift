//
//  FavoriteController.swift
//  Lensify
//
//  Created by Nazrin on 04.03.24.
//

import UIKit

class FavoriteController: UIViewController {
    
    var onUpdate: (([TopicElement]) -> Void)?
    var cont: DetailController?
    var viewModel = FavoriteViewModel()

    @IBOutlet weak var collection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collection.register(UINib(nibName: "\(HomeCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(HomeCell.self)")
    }
    override func viewWillAppear(_ animated: Bool) {
        cont?.callback()
//        collection.reloadData()
    }
}

extension FavoriteController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.detail.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(HomeCell.self)", for: indexPath) as! HomeCell
//        cell.delegate = self
        cell.configureFav(data: viewModel.detail1[indexPath.item])
        cell.tag = indexPath.item
        return cell
        
    }
}
//
//extension FavoriteController: BookmarkDelegate {
//    func addButtonAction(index: Int) {
//        showAlert()
//        self.viewModel.detail.append(viewModel.detail[index])
//        viewModel.detail.append(contentsOf: self.viewModel.detail)
//        onUpdate?(viewModel.detail)
//    }
//}
extension FavoriteController: BookmarkDelegate {
    func addButtonAction(index: Int) {
//        showAlert()
        
        // Add the selected image to the viewModel
        let selectedImage = viewModel.detail[index]
        viewModel.detail.append(selectedImage)
        
        // Update the UI
        collection.reloadData()
        
        // Notify the parent controller about the update
        onUpdate?(viewModel.detail1)
    }
    
//    func showAlert() {
//        // Implement your showAlert logic here if needed
//    }
}
//extension FavoriteController: SaveImageProtocol {
//    func didTapDownloadButton(image: UIImage) {
//    print("something")
//    }
//}
