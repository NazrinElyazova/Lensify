//
//  FavoriteController.swift
//  Lensify
//
//  Created by Nazrin on 04.03.24.
//

import UIKit

class FavoriteController: UIViewController {
    
    var items: [Detail]?
    
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        CoreDataManager.shared.fetchImage { [weak self] item in
            guard let self else { return }
            items = item
            DispatchQueue.main.async { [weak self] in
                guard let self else { return }
                table.reloadData()
            }
            
        }
    }
    
    func configureUI() {
        self.table.backgroundColor = UIColor.black
        self.table.dataSource = self
        self.table.delegate = self
        self.table.register(UINib(nibName: "\(FavoriteCell.self)", bundle: nil), forCellReuseIdentifier: "\(FavoriteCell.self)")
    }
}

extension FavoriteController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(FavoriteCell.self)", for: indexPath) as! FavoriteCell
        
        if let imageData = items![indexPath.item].detailPhoto {
            cell.favoriteImage.image = UIImage(data: imageData)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.contentView.backgroundColor = UIColor.black
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive, title: "Delete") {
            (action, view, completionHandler) in
            
            let photoToRemove = self.items![indexPath.row]
            CoreDataManager.shared.deleteAction(id: photoToRemove){  [weak self] item in
                guard let self else { return }
                items = item
                DispatchQueue.main.async { [weak self] in
                    guard let self else { return }
                    table.reloadData()
                }
            }
        }
        return UISwipeActionsConfiguration(actions: [action])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 230
    }
}
