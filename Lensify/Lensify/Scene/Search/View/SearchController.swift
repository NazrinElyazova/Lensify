//
//  SearchController.swift
//  Lensify
//
//  Created by Nazrin on 16.01.24.
//

import UIKit

class SearchController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var searchTextFieldOutlet: UITextField!
    
    let viewModel = SearchViewModel()
    
    let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchTextFieldOutlet.delegate = self
        
        hideKeyboardWhenTappedAround()
        configureUI()
        configureViewModel()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        searchTextFieldOutlet.becomeFirstResponder()
    }
    
    @IBAction func searchTextField(_ sender: Any) {
        viewModel.getSearchItems(searchText: "\(searchTextFieldOutlet.text ?? "")")
        print("\(String(describing: searchTextFieldOutlet.text))")
    }
    
    func configureUI() {
        self.collection.register(UINib(nibName: "\(SearchCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(SearchCell.self)")
        
        refreshControl.addTarget(self, action: #selector(pullToRefresh), for: .valueChanged)
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
        viewModel.getSearchItems(searchText: searchTextFieldOutlet.text ?? "" )
    }
    
    @objc func pullToRefresh() {
        viewModel.search.removeAll()
        collection.reloadData()
        viewModel.getSearchItems(searchText: searchTextFieldOutlet.text ?? "")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
}
extension SearchController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  viewModel.search.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(SearchCell.self)", for: indexPath) as! SearchCell
        let item = viewModel.search[indexPath.item]
        cell.configure(data: item)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width, height: 200)
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//        if indexPath.item == viewModel.search.count - 1 {
            viewModel.pagination(index: indexPath.item, searchText: searchTextFieldOutlet.text ?? "")
//        }
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
