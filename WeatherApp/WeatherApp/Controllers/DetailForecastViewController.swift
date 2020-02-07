//
//  DetailForecastViewController.swift
//  WeatherApp
//
//  Created by Juan Ceballos on 2/4/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit
import DataPersistence

class DetailForecastViewController: UIViewController {

    private let detailForecastView = DetailForecastView()
    //let favoritesViewController = FavoritesViewController()
    let favoritesView = FavoritesView()
    
    override func loadView()    {
        view = detailForecastView
    }
    
    //var dataPersistence = PersistenceHelper(filename: "cityPhotos.plist")
    var dataPersistence: DataPersistence<PhotoObject>!
    var forecast: DailyForecastWrapper?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "Favorite", style: .plain, target: self, action: #selector(favorite))
        //loadImageObjects()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        updateUI()
    }
    
    var selectedImage: UIImage? {
        didSet  {
            favoritePhoto()
        }
    }
    
    @objc func favorite() {
        
        selectedImage = detailForecastView.cityImage.image
        //favoritesViewController.photoSelectedDelegate?.adjustPhoto(selectedImage!)

        /*
        if let imageData = detailForecastView.cityImage.image?.jpegData(compressionQuality: 0.5){
            let imageObject = PhotoObject(imageData: imageData)
            do  {
                try dataPersistence.create(event: imageObject)
            }
            catch   {
            }
            
            
        }*/
    }
    
    func favoritePhoto()    {
        guard let imageData = selectedImage
            else    {
                return
        }
        
        guard let imageConvert = imageData.jpegData(compressionQuality: 0.5)
            else    {
                return
        }
        
        let imageObject = PhotoObject(imageData: imageConvert)
        //favoritesViewController.photoCollection.insert(imageObject, at: 0)
        //let indexPath = IndexPath(row: 0, section: 0)
        //favoritesView.favoritesCollectionView.insertItems(at: [indexPath])
        
        do  {
            try dataPersistence.createItem(imageObject)
        }
        catch   {
        }
    }
    
//    private func loadImageObjects() {
//        do  {
//            favoritesViewController.photoCollection = try dataPersistence.loadItems()
//        }
//        catch   {
//            print("loading error")
//        }
//    }
    
    
    func updateUI() {
        guard let forecast = forecast
            else    {
                fatalError("Error passing the forecast object, DailyForecastWrapper")
        }
        
        detailForecastView.configureView(forecast: forecast)
    }

}

//extension DetailForecastViewController: PhotoSelectedDelegate {
//    func adjustPhoto(_ photo: UIImage) {
//        selectedImage = photo
//    }
//}
