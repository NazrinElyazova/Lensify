//
//  TopicCell.swift
//  Lensify
//
//  Created by Nazrin on 27.01.24.
//

import UIKit

class TopicCell: UICollectionViewCell {

     @IBOutlet private weak var topicLabel: UILabel!
   
    func configureCell(data: TopicElement) {
      topicLabel.text = data.title
    }
}
