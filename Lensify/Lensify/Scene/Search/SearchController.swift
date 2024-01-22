//
//  SearchController.swift
//  Lensify
//
//  Created by Nazrin on 16.01.24.
//

import UIKit

class SearchController: UIViewController {
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var searchTextFieldOutlet: UITextField!
    
    let viewModel = SearchViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureViewModel()
    }
    
    @IBAction func searchTextField(_ sender: Any) {
        viewModel.getSearchItems(searchText: "\(searchTextFieldOutlet.text ?? "")", pageID: 0)
        print("\(String(describing: searchTextFieldOutlet.text))")
    }
    
    func configureUI() {
        self.collection.register(UINib(nibName: "\(SearchCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(SearchCell.self)")
    }
    
    func configureViewModel() {
        guard searchTextFieldOutlet.text != nil else {return}
        viewModel.onError = {
            errorMessage in
            print("Search controllerde error var: \(errorMessage)")
        }
        viewModel.onSucces = {
            self.collection.reloadData()
        }
    }
}
extension SearchController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
//        print( viewModel.search.count)
        return  viewModel.search.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(SearchCell.self)", for: indexPath) as! SearchCell
        //        cell.backgroundColor = .yellow
        let item = viewModel.search[indexPath.item]
        cell.configure(data: item)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width/3-2, height: 108)
    }
}
