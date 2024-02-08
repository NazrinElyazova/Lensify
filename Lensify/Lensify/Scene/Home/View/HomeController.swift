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
        login()
        configureUI()
        configureViewModel()
    }
    
    func login() {
        UserDefaults.standard.set(true, forKey: "loggedIn")
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
    func presentSaveAndShareSheet() {
        
        guard let image = UIImage(named: "purple"), let url = URL(string: "https://unsplash.com/") else {return}
        
        let saveandshare = UIActivityViewController(
            activityItems: [
                url, image
            ],
            applicationActivities: nil)
        present(saveandshare, animated: true)
    }
}
extension HomeController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(viewModel.items.count)
        return viewModel.items.count
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(HomeCell.self)", for: indexPath) as! HomeCell
        let item = viewModel.items[indexPath.item]
        cell.configure(data: item)
        cell.controller = self
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        //        viewModel.pagination(index: indexPath.item)
    }
}

