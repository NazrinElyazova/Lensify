//
//  FavoriteController.swift
//  Lensify
//
//  Created by Nazrin on 04.03.24.
//

import UIKit

class FavoriteController: UIViewController {
    
    private let manager = SaveFileManager.saveFile
    
    var star = [GetTopics]()
    var onUpdate: (([GetTopics]) -> Void)?
    
    @IBOutlet weak var collection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                hideTitle()
        configureUI()
    }
    
    func configureUI() {
        self.collection.register(UINib(nibName: "\(FavoriteCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(FavoriteCell.self)")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
   
            manager.readJsonFile { star in
                self.star = star
                self.collection.reloadData()
            }
        }
    }

extension FavoriteController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  star.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(FavoriteCell.self)", for: indexPath) as! FavoriteCell
        cell.configureFav(data: star[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width, height: 250)
    }
}

