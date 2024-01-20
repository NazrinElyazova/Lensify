//
//  HomeController.swift
//  Lensify
//
//  Created by Nazrin on 14.01.24.
//

import UIKit

class HomeController: UIViewController {
    
    let viewModel = HomeViewModel()
    
    @IBOutlet weak var edutorialSegment: UISegmentedControl!
    @IBOutlet weak var collection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureViewModel()
    }
    
    @IBAction func edutorialAction(_ sender: UISegmentedControl) {
        switch edutorialSegment.selectedSegmentIndex {
        case 0:
            print("first")
        case 1:
            let controller = storyboard?.instantiateViewController(withIdentifier: "\(NatureController.self)") as! NatureController
            navigationController?.show(controller, sender: nil)
        case 2:
            //            let controller = storyboard?.instantiateViewController(withIdentifier: "\(LaunchController.self)") as! LaunchController
            //            navigationController?.show(controller, sender: nil)
            print("3d renders")
        case 3:
            print("architecture")
        default:
            break
        }
    }
    
    func configureUI() {
        collection.register(UINib(nibName: "\(HomeCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(HomeCell.self)")
        self.collection.reloadData()
    }
    func configureViewModel() {
        viewModel.getHomePhotos()
        viewModel.onSuccess = {
            self.collection.reloadData()
        }
        viewModel.onError = {
            errorMessage in
            print("Home controllerde error var: \(errorMessage)")
        }
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
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width, height: 300)
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderReusableView", for: indexPath) as! HeaderReusableView
        //        header.backgroundColor = .cyan
        return header
    }
    
}
