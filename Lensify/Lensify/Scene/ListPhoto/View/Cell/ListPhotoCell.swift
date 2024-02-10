//
//  ListPhotoCell.swift
//  Lensify
//
//  Created by Nazrin on 06.02.24.
//

import UIKit

class ListPhotoCell: UICollectionViewCell {
    
    @IBOutlet weak var listPhoto: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configure(data: List) {
        listPhoto.loadImage(url: data.url?.small ?? "")
    }
}
