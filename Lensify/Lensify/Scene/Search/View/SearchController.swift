//
//  SearchController.swift
//  Lensify
//
//  Created by Nazrin on 16.01.24.
//

import UIKit

class SearchController: UIViewController, UITextFieldDelegate, UISearchBarDelegate {
    
    let viewModel = SearchViewModel()
    let searchbar = UISearchBar()
    
    @IBOutlet weak var collection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideKeyboardWhenTappedAround()
        configureUI()
        configureViewModel()
        setupSearchbar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationItem.hidesBackButton = false
        navigationController?.setNavigationBarHidden(true, animated: animated)
        searchbar.placeholder = "search".localize
        
    }
    
    // MARK: SEARCH BAR
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        if let text = searchBar.text {
            viewModel.search = []
            viewModel.searchText = text
            collection.reloadData()
        }
    }
    
    func setupSearchbar() {
        searchbar.frame = CGRect(x: 20, y: 80, width: view.frame.size.width-40, height: 50)
        searchbar.layer.cornerRadius = 20.0
        searchbar.layer.masksToBounds = true
        searchbar.translatesAutoresizingMaskIntoConstraints = true
        searchbar.searchTextField.layer.cornerRadius = 20
        searchbar.searchTextField.layer.masksToBounds = true
        searchbar.delegate = self
        searchbar.isUserInteractionEnabled = true
        view.addSubview(searchbar)
    }
    
    func configureUI() {
        self.collection.register(UINib(nibName: "\(SearchCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(SearchCell.self)")
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(true, animated: true)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        searchBar.setShowsCancelButton(false, animated: true)
    }
    
    func configureViewModel() {
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
        viewModel.pagination(index: indexPath.item)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "\(DetailController.self)") as! DetailController
        controller.viewModel = DetailViewModel(id: viewModel.search[indexPath.item].id ?? "")
        controller.searchItem = viewModel.search[indexPath.item]
        print(controller.searchItem = viewModel.search[indexPath.item])
        navigationController?.show(controller, sender: nil)
    }
}

extension SearchController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(SearchController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}


