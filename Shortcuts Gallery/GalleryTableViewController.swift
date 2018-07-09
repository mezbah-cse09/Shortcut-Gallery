//
//  ViewController.swift
//  Shortcuts Gallery
//
//  Created by Marco Capano on 09/07/2018.
//  Copyright © 2018 Marco Capano. All rights reserved.
//

import UIKit

class GalleryTableViewController: UITableViewController {
    
    let dataSource = GalleryDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Gallery"
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.register(UINib(nibName: "GalleryTableViewCell", bundle: nil), forCellReuseIdentifier: "galleryCell")
        tableView.dataSource = dataSource
        tableView.delegate = dataSource
        tableView.separatorStyle = .none
        tableView.contentInset.top = 30
        
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(load), for: .valueChanged)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        load()
    }
    
    @objc private func load() {
        Shortcut.loadLatest { (response) in
            DispatchQueue.main.async {
                self.dataSource.shortcuts = response.results
                self.tableView.reloadData()
                self.refreshControl?.endRefreshing()
            }
        }
    }
}

