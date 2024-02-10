//
//  HomeController.swift
//  Lensify
//
//  Created by Nazrin on 14.01.24.
//

import UIKit
import Photos

class HomeController: UIViewController {
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var topicView: UIView!
    
    private let topicHeaderView = TopicHeaderView.loadFromNib()
    let viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        configureUI()
        configureViewModel()
    }
  
    
    func configureUI() {
        topicView.addSubview(topicHeaderView)
        topicHeaderView.callback = { id in
            self.viewModel.items.removeAll()
            self.viewModel.getPhotos(id: id)
            //            print("getPhotos callback called")
        }
        
        topicHeaderView.frame = topicView.bounds
        collection.register(UINib(nibName: "\(HomeCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(HomeCell.self)")
    }
    
    func configureViewModel() {
        viewModel.getTopics()
        
        viewModel.topicSuccess = {
            self.topicHeaderView.configure(data: self.viewModel.topicItems)
        }
        
        viewModel.onSuccess = {
            self.collection.reloadData()
        }
        
        viewModel.onError = {
            errorMessage in
            print("Home controllerde error var: \(errorMessage)")
        }
    }
    func presentSaveAndShareSheet(image: UIImage) {
        let saveandshare = UIActivityViewController(
            activityItems: [image],
            applicationActivities: nil)
        present(saveandshare, animated: true)
    }
}
extension HomeController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //        print(viewModel.items.count)
        return viewModel.items.count
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(HomeCell.self)", for: indexPath) as! HomeCell
        let item = viewModel.items[indexPath.item]
        cell.configure(data: item)
        cell.delegate = self
        return cell
        
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        //        viewModel.pagination(index: indexPath.item)
    }
}

extension HomeController: SaveImageProtocol {
    
    func didTApDownloadButton(image: UIImage) {
        if UserDefaults.standard.bool(forKey: "loggedIn") {
//            print(UserDefaults.standard.bool(forKey: "loggedIn"))
            presentSaveAndShareSheet(image: image )
        } else {
          showAlert()
        }
    }
    func showAlert() {
        let alertController = UIAlertController(title: "Warning!", message: "You have no account. Please, login.", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .default) {_ in
            let controller = self.storyboard?.instantiateViewController(withIdentifier: "\(LoginController.self)") as! LoginController
            self.navigationController?.show(controller, sender: nil)
        }
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel)
        alertController.addAction(okButton)
        alertController.addAction(cancelButton)
        present(alertController, animated: true)
    }

}
