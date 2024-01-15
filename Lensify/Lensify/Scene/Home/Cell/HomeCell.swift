//
//  HomeCell.swift
//  Lensify
//
//  Created by Nazrin on 14.01.24.
//

import UIKit

class HomeCell: UICollectionViewCell {
var items = [Wallpapers]()
    @IBOutlet weak var homeLabel: UILabel!
    @IBOutlet weak var homeImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configure(data: Wallpapers) {

        homeLabel.text = data.title
        homeImage.loadImage(url: data.coverPhoto?.urls?.small ?? "")
//        homeLabel.text = data.user?.instagramUsername
    }

}
