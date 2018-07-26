//
//  GalleryCollectionViewController.swift
//  Shortcuts Gallery
//
//  Created by Marco Capano on 26/07/2018.
//  Copyright © 2018 Marco Capano. All rights reserved.
//

import UIKit

class GalleryCollectionViewController: UICollectionViewController {
    
    var data = ShortcutResponse(count: 0, results: [])
    lazy var refreshControl = UIRefreshControl()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Register cell classes
        self.collectionView.register(UINib(nibName: "GalleryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "galleryCell")
        self.collectionView.backgroundColor = .white
        self.collectionView.contentInset = UIEdgeInsets(top: 8, left: 2, bottom: 0, right: 2)
        
        //Custom setup
        configureNavBar()
        configureRefresh()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        load()
    }

    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "galleryCell", for: indexPath) as? GalleryCollectionViewCell
        precondition(cell != nil, "Couldn't load GalleryCollectionViewCell")
        
        let shortcut = data.results[indexPath.row]
        
        // Configure the cell
        cell?.mainLabel.text = shortcut.title
        cell?.secondaryLabel.text = shortcut.summary
        cell?.bottomLabel.text = "\(shortcut.actionCount) Actions"
        cell?.box.backgroundColor = Colors.random()
        cell?.backgroundColor = .white
        
        
        return cell!
    }
  
    @objc private func showAbout() {
        let about = AboutTableViewController()
        navigationController?.pushViewController(about, animated: true)
    }
    
    @objc private func load() {
        Shortcut.loadLatest { (response) in
            DispatchQueue.main.async {
                self.data = response
                self.collectionView.reloadData()
                self.refreshControl.endRefreshing()
            }
        }
    }
    
    private func configureRefresh() {
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(load), for: .valueChanged)
        collectionView.refreshControl = refreshControl
    }
    
    private func configureNavBar() {
        title = "Gallery"
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let infoButton = UIButton(type: .infoLight)
        infoButton.addTarget(self, action: #selector(showAbout), for: .touchUpInside)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: infoButton)
    }

}
