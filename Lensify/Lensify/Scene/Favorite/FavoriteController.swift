//
//  FavoriteController.swift
//  Lensify
//
//  Created by Nazrin on 04.03.24.
//

import UIKit

class FavoriteController: UIViewController {
    
    let manager = CoreDataManager()
    @IBOutlet weak var table: UITableView!
    var items: [Detail]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.table.backgroundColor = UIColor.black
        self.table.dataSource = self
        self.table.delegate = self

        configureUI()
    }
    
    func configureUI() {
        self.table.register(UINib(nibName: "\(FavoriteCell.self)", bundle: nil), forCellReuseIdentifier: "\(FavoriteCell.self)")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
            manager.fetchImage()
            manager.success = { [weak self] item in
                guard let self else { return }
                items = item
                DispatchQueue.main.async { [weak self] in
                    guard let self else { return }
                    table.reloadData()
                }
        }
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
            self.manager.context.delete(photoToRemove)
            self.manager.deleteAction()
            self.manager.fetchImage()
        }
        return UISwipeActionsConfiguration(actions: [action])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 230
    }
}
