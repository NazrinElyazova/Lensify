//
//  SearchCell.swift
//  Lensify
//
//  Created by Nazrin on 16.01.24.
//

import UIKit

class SearchCell: UICollectionViewCell {
    @IBOutlet weak var searchLabel: UILabel!
    
    @IBOutlet weak var searchUIView: UIView!
    @IBOutlet weak var searchImageview: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        searchUIView.alpha = 0.5
    }
    func configure(data: SearchResult) {
        searchLabel.text = data.title
        searchImageview.loadImage(url: data.coverPhoto?.urls?.small ?? "")
    }
}
