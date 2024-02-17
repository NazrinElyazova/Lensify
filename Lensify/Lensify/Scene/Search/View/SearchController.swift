//
//  SearchController.swift
//  Lensify
//
//  Created by Nazrin on 16.01.24.
//

import UIKit

class SearchController: UIViewController, UITextFieldDelegate {
    
    let viewModel = SearchViewModel()
    
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var searchTextFieldOutlet: UITextField!
    
    @IBAction func searchTextField(_ sender: Any) {
        print("textimiz: \(searchTextFieldOutlet.text ?? "")")
        textFieldDidEndEditing(searchTextFieldOutlet)
//        viewModel.getSearchItems(searchText: searchTextFieldOutlet.text ?? "", limit: 10)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchTextFieldOutlet.delegate = self
        
        hideKeyboardWhenTappedAround()
        configureUI()
        configureViewModel()
        
        title = "Search"
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        searchTextFieldOutlet.becomeFirstResponder()
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
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    func presentSaveAndShareSheet(image: UIImage) {
        let saveandshare = UIActivityViewController(
            activityItems: [image],
            applicationActivities: nil)
        present(saveandshare, animated: true)
    }
    

    func textFieldDidEndEditing(_ textField: UITextField) {
        viewModel.getSearchItems(searchText: textField.text ?? "", limit: 10)
//        collection.reloadData()
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
