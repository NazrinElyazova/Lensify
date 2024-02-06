//
//  ListPhotoController.swift
//  Lensify
//
//  Created by Nazrin on 06.02.24.
//

import UIKit
import CHTCollectionViewWaterfallLayout

class ListPhotoController: UIViewController {
    let viewModel = ListPhotoViewModel()
    @IBOutlet weak var collection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        configureViewModel()
        change()
        didIt()
    }
    
    func configureUI() {
        self.collection.register(UINib(nibName: "\(ListPhotoCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(ListPhotoCell.self)")
    }
    func configureViewModel() {
        viewModel.error = {
            errorMessage in
            print("ListPhotoControllerde error var: \(errorMessage)")
        }
        viewModel.success = {
            self.collection.reloadData()
        }
        viewModel.listPhoto()
    }
    func change() {
        let layout = CHTCollectionViewWaterfallLayout()
        layout.itemRenderDirection = .leftToRight
        layout.columnCount = 2
        collection.collectionViewLayout = layout
    }
    
    func didIt() {
        let images = Array(1...100).map { "image\($0)" }
        viewModel.items = images.compactMap { _ in
            
            let ur = Urls(small: "https://images.unsplash.com/photo-1513635269975-59663e0ac1ad?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w1NDQ5MTZ8MHwxfHNlYXJjaHwxfHxsb25kb258ZW58MHx8fHwxNzA3MjIzODIwfDA&ixlib=rb-4.0.3&q=80&w=400"
            )
     
            //            return ListPhoto.init(urls: ur, height: CGFloat.random(in: 200...400))
            //            return List.init(/*id: id,*/ urls: ur)
            return List.init(url: ur, height: CGFloat.random(in: 100...400))
        }
        print(viewModel.items.map { $0.url })
        self.collection.reloadData()
    }
}
extension ListPhotoController: UICollectionViewDelegate, UICollectionViewDataSource, CHTCollectionViewDelegateWaterfallLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(ListPhotoCell.self)", for: indexPath) as! ListPhotoCell
        cell.configure(data: viewModel.items[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.size.width/2, height: /*200*/ viewModel.items[indexPath.item].height ?? 10)
    }
}
