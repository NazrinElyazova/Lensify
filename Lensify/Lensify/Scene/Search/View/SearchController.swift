//
//  SearchController.swift
//  Lensify
//
//  Created by Nazrin on 16.01.24.
//

import UIKit

class SearchController: UIViewController, UITextFieldDelegate, UISearchBarDelegate {
    
    let viewModel = SearchViewModel()
    
    
    @IBOutlet weak var collection: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
                
//        hideKeyboardWhenTappedAround()
        configureUI()
        configureViewModel()
        
        navigationItem.hidesSearchBarWhenScrolling = true

        let searchbar = UISearchBar()
        searchbar.frame = CGRect(x: 10, y: 100, width: view.frame.size.width-10, height: 50)
        searchbar.layer.cornerRadius = 20
        searchbar.placeholder = "Search for new lives"
//        searchbar.backgroundColor = .black
        searchbar.translatesAutoresizingMaskIntoConstraints = true
        searchbar.searchTextField.layer.cornerRadius = 20
        searchbar.searchTextField.layer.masksToBounds = true
        searchbar.delegate = self
        view.addSubview(searchbar)

        searchbar.delegate = self
        searchbar.isUserInteractionEnabled = true
//        title = "Search"
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)

    }
    // MARK: SEARCH BAR
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        if let text = searchBar.text {
            viewModel.search = []
            viewModel.pagination(searchText: text)
            collection.reloadData()
           
        }
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
     
//        guard searchTextFieldOutlet.text != nil else {return}
        
        viewModel.onError = {
            errorMessage in
            print("Search controllerde error var: \(errorMessage)")
        }
        
        viewModel.onSucces = {
            self.collection.reloadData()
            
        }
    }

    func presentSaveAndShareSheet(image: UIImage) {
        let saveandshare = UIActivityViewController(
            activityItems: [image],
            applicationActivities: nil)
        present(saveandshare, animated: true)
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
        cell.delegate = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//        if indexPath.item == viewModel.search.count - 1 {
//               viewModel.pagination(searchText: searchTextFieldOutlet.text ?? "")
//           }
        let searchbar = UISearchBar()
        viewModel.pagination(searchText: searchbar.text ?? "")
    }
    
}

//extension UIViewController {
//    func hideKeyboardWhenTappedAround() {
//        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
//        tap.cancelsTouchesInView = false
//        view.addGestureRecognizer(tap)
//    }
//    
//    @objc func dismissKeyboard() {
//        view.endEditing(true)
//    }
//}
extension SearchController: SaveImageProtocol {
    func didTApDownloadButton(image: UIImage) {
        if UserDefaults.standard.bool(forKey: "loggedIn") {
            presentSaveAndShareSheet(image: image)
        }
        else {
            showAlert()
        }
    }
    func showAlert() {
        let alertController = UIAlertController(title: "Warning!", message: "You have no account. Please, login.", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .default) {_ in
            let controller = self.storyboard?.instantiateViewController(withIdentifier: "\(LoginController.self)") as! LoginController
            self.navigationController?.show(controller, sender: nil)
        }
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel)
        alertController.addAction(okButton)
        alertController.addAction(cancelButton)
        present(alertController, animated: true)
    }
}

