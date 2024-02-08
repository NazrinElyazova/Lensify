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

class HomeCell: UICollectionViewCell {
    weak var controller: HomeController?
    
    var u: UrlsWallpapers?

    
    @IBOutlet weak var homeLabel: UILabel!
    @IBOutlet weak var homeImage: UIImageView!
    
    @IBOutlet weak var saveButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func saveOrShareButtonAction(_ sender: Any) {
//        if let wall = test {
        
//        if let gifData = try? Data(contentsOf: URL(string: self.u?.small ?? "")!) {
//            self.saveImageToLibrary(gifData: gifData)
        guard let image = homeImage.image else {return}
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(image(_: didFinishSavingWithError: contextInfo:)), nil)
        controller?.presentSaveAndShareSheet(/*data: test*/)

        }
//        }
//        else {
//            print("deyer yoxdur")
//        }
    @objc func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
//        if let error = error {
//            let alertcont1 = UIAlertController(title: "Save error", message: error.localizedDescription, preferredStyle: .alert)
//            
//            alertcont1.addAction(UIAlertAction(title: "Ok", style: .default))
//            controller?.present(alertcont1, animated: true)
//
//        } else {
            let alertcont2 = UIAlertController(title: "Saved ! ", message: "Your alerted image has been saved to your gallery.", preferredStyle: .alert)
            alertcont2.addAction(UIAlertAction(title: "OK", style: .default))
            controller?.present(alertcont2, animated: true)
//        }
    }

func configure(data: GetTopics) {
//        homeLabel.text = data.title
    homeImage.loadImage(url: data.urls?.small ?? "")
    
    //        print("\(data.id)")
    //            print(homeImage.image ?? "NO image ")
    //        print(homeLabel.text ?? "bosdur label")
}
  
    func saveImageToLibrary(gifData: Data) {
        PHPhotoLibrary.shared().performChanges {
            let creationRequest = PHAssetCreationRequest.forAsset()
            creationRequest.addResource(with: .photo, data: gifData, options: nil)
        } completionHandler: { success, error in
            if success {
                print("Image saved to library")
            } else if let error = error {
                print("Error bas verdi: \(error.localizedDescription)")
            }
        }
    }
    
}

