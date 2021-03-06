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
        
        guard let cv = collectionView else { return }

        //Setup
        configureCollectionView(cv)
        goLargeTitle(text: "Gallery")
        add(button: UIButton(type: .infoLight), position: .right, selector: #selector(showAbout))
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
                self.collectionView?.reloadData()
                self.refreshControl.endRefreshing()
            }
        }
    }
    
    private func configureCollectionView(_ cv: UICollectionView) {
        // Register cell classes
        cv.register(UINib(nibName: "GalleryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "galleryCell")
        cv.backgroundColor = .white
        cv.contentInset = UIEdgeInsets(top: 8, left: 2, bottom: 0, right: 2)
        cv.add(refreshControl: refreshControl, target: self, selector: #selector(load))
    }
}
