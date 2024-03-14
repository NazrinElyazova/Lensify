//
//  FavoriteCell.swift
//  Lensify
//
//  Created by Nazrin on 13.03.24.
//

import UIKit

class FavoriteCell: UICollectionViewCell {
    
    @IBOutlet weak var favoriteImage: UIImageView!
    
    func configureFav(data: GetTopics) {
        favoriteImage.layer.cornerRadius = 10
        favoriteImage.loadImage(url: data.urls?.small ?? "")
    }
}