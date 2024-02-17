//
//  HomeCell.swift
//  Lensify
//
//  Created by Nazrin on 14.01.24.
//

import UIKit
import Photos

//
//protocol HomeCellProtocol {
//    var titleLabel: String { get }
//    var imagePath: String { get }
//}

protocol SaveImageProtocol: AnyObject {
    func didTApDownloadButton(image: UIImage)
}

class HomeCell: UICollectionViewCell {
    
    weak var delegate: SaveImageProtocol?
    
    @IBOutlet weak var homeImage: UIImageView!
    
    @IBOutlet weak var saveButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func saveOrShareButtonAction(_ sender: Any) {
        guard let image = homeImage.image else {return}
        delegate?.didTApDownloadButton(image: image)
    }
    
    func configure(data: GetTopics) {
        homeImage.loadImage(url: data.urls?.small ?? "")
            }
    
}

