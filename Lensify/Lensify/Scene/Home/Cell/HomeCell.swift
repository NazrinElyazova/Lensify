//
//  HomeCell.swift
//  Lensify
//
//  Created by Nazrin on 14.01.24.
//

import UIKit
//protocol HomeCellProtocol {
//    var titleLabel: String { get }
//    var imagePath: String { get }
//}

class HomeCell: UICollectionViewCell {
var items = [Wallpapers]()
    @IBOutlet weak var homeLabel: UILabel!
    @IBOutlet weak var homeImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configure(data: Wallpapers) {

        homeLabel.text = data.altDescription
        homeImage.loadImage(url: data.urls?.small ?? "")
    }
    func configure2(data: Photo) {
        homeImage.loadImage(url: data.urls?.small ?? "")
        homeLabel.text = data.altDescription
    }
//    func configure(data: HomeCellProtocol) {
//        homeImage.loadImage(url: data.imagePath)
//        homeLabel.text = data.titleLabel
//    }
}
