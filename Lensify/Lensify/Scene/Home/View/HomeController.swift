//
//  HomeController.swift
//  Lensify
//
//  Created by Nazrin on 14.01.24.
//

import UIKit
import SkeletonView
import Combine

class HomeController: UIViewController {
    
    private let topicHeaderView = TopicHeaderView.loadFromNib()
    private let viewModel = HomeViewModel()
    
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var topicView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        skeletonConfigure()
        configureViewModel()
    }
    
    func configureUI() {
        navigationItem.title = "Lensify"
        topicView.addSubview(topicHeaderView)
        topicHeaderView.callback = { [weak self] id in
            self?.viewModel.items.removeAll()
            self?.collection.reloadData()
            self?.viewModel.topicId = id
        }
        
        topicHeaderView.frame = topicView.bounds
        collection.register(UINib(nibName: "\(HomeCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(HomeCell.self)")
    }
    
    func configureViewModel() {
        viewModel.getTopics()
        viewModel.topicSuccess = {
            self.topicHeaderView.configure(data: self.viewModel.topicItems)
        }
        
//        viewModel.onSuccess = {
//            self.collection.reloadData()
//        }()
//        
//        viewModel.onError = {
//            errorMessage in
//            print("Home controllerde error var: \(errorMessage)")
//        }
        
        viewModel.onSuccess = PassthroughSubject<Void, Never>()
        viewModel.onSuccess
            .sink { [weak self] in
                self?.collection.reloadData()
            }
            .store(in: &viewModel.cancellables)

        viewModel.onError = PassthroughSubject<String, Never>()
        
        viewModel.onError
            .sink { errorMessage in
                print("Home controllerde error var: \(errorMessage)")
            }
            .store(in: &viewModel.cancellables)

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
        viewModel.pagination(index: indexPath.item)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "\(DetailController.self)") as! DetailController
        controller.viewModel = DetailViewModel(id: viewModel.items[indexPath.item].id ?? "")
        controller.item = viewModel.items[indexPath.item]
        navigationController?.show(controller, sender: nil)
    }
}

extension HomeController: SaveImageProtocol {
    func didTapDownloadButton(image: UIImage) {
        if UserDefaults.standard.bool(forKey: "loggedIn") {
            presentSaveAndShareSheet(image: image )
        }
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
        collection.isSkeletonable = true
        collection.showAnimatedGradientSkeleton(usingGradient: .init(baseColor: .darkClouds),
                                                animation: nil,
                                                transition: .crossDissolve(0.10))
    }
}
