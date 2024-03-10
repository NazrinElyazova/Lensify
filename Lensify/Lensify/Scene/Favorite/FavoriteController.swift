//
//  FavoriteController.swift
//  Lensify
//
//  Created by Nazrin on 04.03.24.
//

import UIKit

class FavoriteController: UIViewController {
 
    
    var viewModel: FavoriteViewModel?
    
    @IBOutlet weak var collection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideTitle()
        configureViewModel()
        configureUI()
    }

    func configureUI() {
        self.collection.register(UINib(nibName: "\(HomeCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(HomeCell.self)")
    }
    
    func configureViewModel() {
        viewModel?.getDetailPhoto()
        viewModel?.onSuccess = {
            self.collection.reloadData()
        }
    }
}

extension FavoriteController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //        print(viewModel.detail.count)
        return  viewModel?.detail.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(HomeCell.self)", for: indexPath) as! HomeCell
        if let model = viewModel?.detail[indexPath.item] {
            cell.configure(data: model)
        }
        return cell

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width, height: 200)
    }
}
