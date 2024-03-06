//
//  FavoriteController.swift
//  Lensify
//
//  Created by Nazrin on 04.03.24.
//

import UIKit

class FavoriteController: UIViewController {
    var model = [Favorite]()
//    let manager = SaveFileManager()
    
    var onUpdate: (([Favorite]) -> Void)?
    var cont: DetailController?

    @IBOutlet weak var collection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        self.collection.register(UINib(nibName: "\(HomeCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(HomeCell.self)")
    }
    override func viewWillAppear(_ animated: Bool) {
        cont?.callback()
    }
}
extension FavoriteController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        model.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(HomeCell.self)", for: indexPath) as! HomeCell
        cell.configureFav(data: model[indexPath.item])
        cell.tag = indexPath.item
        return cell
        
    }
}
extension FavoriteController: BookmarkDelegate {
    func addButtonAction(index: Int) {
        showAlert()
        self.model.append(model[index])
        model.append(contentsOf: self.model)
//        manager.writeJsonData(items: model)
        onUpdate?(model)
    }
}
