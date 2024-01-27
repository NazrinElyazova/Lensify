//
//  NatureReusableView.swift
//  Lensify
//
//  Created by Nazrin on 16.01.24.
//

import UIKit

class NatureReusableView: UICollectionReusableView {
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        collection.delegate = self
        collection.dataSource = self
        
        collection.register(UINib(nibName: "\(TopicCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(TopicCell.self)")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBOutlet weak var collection: UICollectionView!
    var items = [Photo]()
}
extension NatureReusableView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        70
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(TopicCell.self)", for: indexPath) as! TopicCell
        cell.topicLabel?.text = items[indexPath.item].title
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width/3, height: 40)
    }
}
