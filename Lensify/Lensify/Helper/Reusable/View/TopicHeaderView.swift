//
//  TopicHeaderView.swift
//  Lensify
//
//  Created by Nazrin on 27.01.24.
//

import UIKit

class TopicHeaderView: UIView {
    @IBOutlet weak var collection: UICollectionView!
    
    var top = [TopicElement]()
    var callback: ((String) -> Void)?
    
    override func layoutSubviews() {
        collection.register(UINib(nibName: "\(TopicCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(TopicCell.self)")
    }
    
    func configure(data: [TopicElement]) {
        top = data
        collection.reloadData()
        callback?(top.first?.id ?? "")
    }
}
extension TopicHeaderView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        top.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(TopicCell.self)", for: indexPath) as! TopicCell
        cell.topicLabel.text = top[indexPath.item].title
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        callback?(top[indexPath.item].id ?? "")
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: 120, height: collectionView.bounds.height)
    }
}
