//
//  FavoriteController.swift
//  Lensify
//
//  Created by Nazrin on 04.03.24.
//

import UIKit

class FavoriteController: UIViewController {
//    private let manager = SaveFileManager.saveFile
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    var items: [Detail]?
    
    var star = [GetTopics]()
    var onUpdate: (([GetTopics]) -> Void)?
    
    @IBOutlet weak var collection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchImage()

        hideTitle()
        configureUI()
    }
    
    func configureUI() {
        self.collection.register(UINib(nibName: "\(FavoriteCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(FavoriteCell.self)")
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        
//        manager.readJsonFile { star in
//            self.star = star
//            self.collection.reloadData()
//        }
//    }
    
    func fetchImage() {
        do {
            self.items = try context.fetch(Detail.fetchRequest())
            DispatchQueue.main.async {
                self.collection.reloadData()
            }
        } catch {
            
        }
    }
}

extension FavoriteController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  items?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(FavoriteCell.self)", for: indexPath) as! FavoriteCell

        if let imageData = items![indexPath.item].detailPhoto {
               cell.favoriteImage.image = UIImage(data: imageData)
           }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width, height: 250)
    }
}

