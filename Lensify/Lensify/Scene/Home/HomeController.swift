//
//  HomeController.swift
//  Lensify
//
//  Created by Nazrin on 14.01.24.
//

import UIKit

class HomeController: UIViewController {
  var viewModel = HomeViewModel()
    
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
            let controller = storyboard?.instantiateViewController(withIdentifier: "\(ColorController.self)") as! ColorController
           present(controller, animated: true)
        case 2:
            let controller = storyboard?.instantiateViewController(withIdentifier: "\(LaunchController.self)") as! LaunchController
            navigationController?.show(controller, sender: nil)
        default:
            break
        }
    }
    
    func configureUI() {
        collection.register(UINib(nibName: "\(HomeCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(HomeCell.self)")
    }
    func configureViewModel() {
        viewModel.getPhotos()
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
        print(viewModel.items.count)
       return viewModel.items.count
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(HomeCell.self)", for: indexPath) as! HomeCell
        cell.configure(data: viewModel.items[indexPath.item])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width, height: 300)
    }
    
}
