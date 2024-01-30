////
////  NatureController.swift
////  Lensify
////
////  Created by Nazrin on 15.01.24.
////
//
//import UIKit
//
//class NatureController: UIViewController {
//    let viewModel = NatureViewModel()
//    @IBOutlet weak var collection: UICollectionView!
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        configureViewModel()
//        configureUI()
//    }
//    func configureViewModel() {
//        viewModel.getNature()
//        viewModel.onError = {
//            errorMessage in
//            print("Nature controllerde error var: \(errorMessage)")
//        }
//        viewModel.onSuccess = {
//            self.collection.reloadData()
//        }
//    }
//    func configureUI() {
//        self.collection.register(UINib(nibName: "\(HomeCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(HomeCell.self)")
////        collection.register(UINib(nibName: "\(TopicCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(TopicCell.self)")
//    }
//}
//extension NatureController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        viewModel.nature.count
//    }
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(HomeCell.self)", for: indexPath) as! HomeCell
//        //        cell.backgroundColor = .cyan
//        cell.configure2(data: viewModel.nature[indexPath.item])
//        
//        return cell
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        .init(width: collectionView.frame.width, height: 200)
//    }
////    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
////        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "\(NatureReusableView.self)", for: indexPath) as! NatureReusableView
////        return header
////    }
//}
