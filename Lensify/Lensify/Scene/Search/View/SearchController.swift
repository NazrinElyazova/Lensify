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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchTextFieldOutlet.delegate = self
        
        hideKeyboardWhenTappedAround()
        configureUI()
        configureViewModel()
        
        title = "Search For New Lives"
        self.navigationController?.navigationBar.topItem?.title = ""
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        searchTextFieldOutlet.becomeFirstResponder()
    }
    
    @IBAction func searchTextField(_ sender: Any) {
        viewModel.getSearchItems(searchText: searchTextFieldOutlet.text ?? "", limit: 10)
    }
    
    func configureUI() {
        self.collection.register(UINib(nibName: "\(SearchCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(SearchCell.self)")
    }
    
    func configureViewModel() {
        
//        viewModel.getSearchItems(searchText: searchTextFieldOutlet.text ?? "", limit: 10)
        guard searchTextFieldOutlet.text != nil else {return}
        
        viewModel.onError = {
            errorMessage in
            print("Search controllerde error var: \(errorMessage)")
        }
        viewModel.onSucces = {
                self.collection.reloadData()
        
        }
    }
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
//        let updatedText = (searchTextFieldOutlet.text as NSString?)?.replacingCharacters(in: range, with: string) ?? ""
//        viewModel.getSearchItems(searchText: updatedText, limit: 10)
//        return true
//    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
          textField.resignFirstResponder()
//        if ((viewModel.search.count - 1) != 0) {
            viewModel.getSearchItems(searchText: textField.text ?? "", limit: 10)
      
//        }
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
        viewModel.pagination(searchText: searchTextFieldOutlet.text ?? "")
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
