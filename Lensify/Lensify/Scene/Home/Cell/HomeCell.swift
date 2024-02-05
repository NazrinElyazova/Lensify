//
//  HomeCell.swift
//  Lensify
//
//  Created by Nazrin on 14.01.24.
//

import UIKit

protocol HomeCellProtocol {
    var titleLabel: String { get }
    var imagePath: String { get }
}

class HomeCell: UICollectionViewCell {
    
    @IBOutlet weak var homeLabel: UILabel!
    @IBOutlet weak var homeImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configure(data: Wallpapers) {
        homeLabel.text = data.description
        homeImage.loadImage(url: data.urls?.small ?? "")
        
        //        print("\(data.id)")
        //            print(homeImage.image ?? "NO image ")
        //        print(homeLabel.text ?? "bosdur label")
    }
    
    //    func configure(data: HomeCellProtocol) {
    //        homeImage.loadImage(url: data.imagePath)
    //        homeLabel.text = data.titleLabel
    //    }
}
//}
