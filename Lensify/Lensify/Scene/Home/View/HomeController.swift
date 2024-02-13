//
//  HomeController.swift
//  Lensify
//
//  Created by Nazrin on 14.01.24.
//

import UIKit
import Photos
import SkeletonView

class HomeController: UIViewController {
    
    let viewModel = HomeViewModel()
    
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var topicView: UIView!
    
    private let topicHeaderView = TopicHeaderView.loadFromNib()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        //        configureViewModel()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        skeletonConfigure()
        collection.isSkeletonable = true
        collection.showAnimatedGradientSkeleton(usingGradient: .init(baseColor: .darkClouds),
                                                animation: nil,
                                                transition: .crossDissolve(0.10))
        configureViewModel()
        
    }
    
    func configureUI() {
        topicView.addSubview(topicHeaderView)
        topicHeaderView.callback = { id in
            self.viewModel.items.removeAll()
            self.viewModel.getPhotos(id: id, limit: 10)
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
        viewModel.pagination(id: "qPYsDzvJOYc")
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
extension HomeController: SkeletonCollectionViewDataSource {
    func collectionSkeletonView(_ skeletonView: UICollectionView, cellIdentifierForItemAt indexPath: IndexPath) -> SkeletonView.ReusableCellIdentifier {
        return "\(HomeCell.self)"
    }
    func skeletonConfigure() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5, execute: {
            
            self.collection.stopSkeletonAnimation()
            self.view.hideSkeleton(reloadDataAfter: true, transition: .crossDissolve(0.25))
            self.collection.reloadData()
        })
    }
}
