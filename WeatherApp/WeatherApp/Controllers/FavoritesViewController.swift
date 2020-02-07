//
//  FavoritesViewController.swift
//  WeatherApp
//
//  Created by Juan Ceballos on 2/4/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit
import DataPersistence

//protocol PhotoSelectedDelegate: AnyObject {
//    func adjustPhoto(_ photo: UIImage)
//}

class FavoritesViewController: UIViewController {

    //weak var photoSelectedDelegate: PhotoSelectedDelegate?
    
    let favoritesView = FavoritesView()
    //let favoritesCell = FavoritesCell()
    //let detailFavoritesController = DetailForecastViewController()
    
    //let favoritesViewController = FavoritesViewController()
    
    //let persistenceHelper = PersistenceHelper(filename: "cityPhotos.plist")
    public var dataPersistence: DataPersistence<PhotoObject>!

    
    var photoCollection = [PhotoObject]()  
    
    override func loadView() {
        view = favoritesView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        favoritesView.favoritesCollectionView.dataSource = self
        favoritesView.favoritesCollectionView.register(FavoritesCell.self, forCellWithReuseIdentifier: "favoritesCell")
        
        loadImages()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        //loadImages()
    }
    
    func loadImages()   {
        do  {
            photoCollection = try dataPersistence.loadItems()
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
    
    // favoritesCell.favoritesReuseIdentifier
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "favoritesCell", for: indexPath) as! FavoritesCell
    
        let photo = photoCollection[indexPath.row]
        
        cell.favoritedImage.image = UIImage(data: photo.imageData)
        cell.layer.borderColor = UIColor.systemGreen.cgColor
        cell.layer.borderWidth = 10
        return cell
    }
}

extension FavoritesViewController: DataPersistenceDelegate {
    func didSaveItem<T>(_ persistenceHelper: DataPersistence<T>, item: T) where T : Decodable, T : Encodable, T : Equatable {
        favoritesView.favoritesCollectionView.reloadData()
    }
    
    func didDeleteItem<T>(_ persistenceHelper: DataPersistence<T>, item: T) where T : Decodable, T : Encodable, T : Equatable {
        
    }
}
