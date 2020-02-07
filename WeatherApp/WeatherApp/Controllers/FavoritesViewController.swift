//
//  FavoritesViewController.swift
//  WeatherApp
//
//  Created by Juan Ceballos on 2/4/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController {

    let favoritesView = FavoritesView()
    let favoritesCell = FavoritesCell()
    let persistenceHelper = PersistenceHelper(filename: "cityPhotos.plist")
    
    var photoCollection = [PhotoObject]()  {
        didSet  {
            DispatchQueue.main.async {
                self.favoritesView.favoritesCollectionView.reloadData()
            }
        }
    }
    
    override func loadView() {
        view = favoritesView
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        favoritesView.favoritesCollectionView.dataSource = self
        favoritesView.favoritesCollectionView.register(FavoritesCell.self, forCellWithReuseIdentifier: "favoritesCell")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        loadImages()
    }
    
    func loadImages()   {
        do  {
            photoCollection = try persistenceHelper.loadPhotos()
        }
        catch   {
            print("loading error")
        }
    }
    
}

extension FavoritesViewController: UICollectionViewDataSource   {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoCollection.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: favoritesCell.favoritesReuseIdentifier, for: indexPath) as! FavoritesCell
    
        let photo = photoCollection[indexPath.row]
        
        cell.favoritedImage.image = UIImage(data: photo.imageData)
        cell.layer.borderColor = UIColor.systemOrange.cgColor
        cell.layer.borderWidth = 10
        return cell
    }
    
    
}
