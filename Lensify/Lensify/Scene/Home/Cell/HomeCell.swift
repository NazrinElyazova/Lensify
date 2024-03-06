//
//  HomeCell.swift
//  Lensify
//
//  Created by Nazrin on 14.01.24.
//

import UIKit
import Photos

protocol SaveImageProtocol: AnyObject {
    func didTapDownloadButton(image: UIImage)
}

class HomeCell: UICollectionViewCell {
    
    weak var delegate: SaveImageProtocol?
        
    @IBOutlet weak var homeImage: UIImageView!
    @IBOutlet weak var saveButton: UIButton!
  
    @IBAction func saveOrShareButtonAction(_ sender: Any) {
        guard let image = homeImage.image else {return}
        delegate?.didTapDownloadButton(image: image)
    }
    
    func configure(data: GetTopics) {
        homeImage.loadImage(url: data.urls?.regular ?? "")
    }
//    func configureFav(data: GetTopics) {
//        homeImage.loadImage(url: data.urls?.regular ?? "")
//    }
}

