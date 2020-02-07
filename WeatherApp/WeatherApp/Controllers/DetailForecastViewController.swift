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
    let favoritesView = FavoritesView()
    
    override func loadView()    {
        view = detailForecastView
    }
    
    var dataPersistence: DataPersistence<PhotoObject>!
    var forecast: DailyForecastWrapper?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "Favorite", style: .plain, target: self, action: #selector(favorite))
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
        
        do  {
            try dataPersistence.createItem(imageObject)
        }
        catch   {
        }
    }
    
    func updateUI() {
        guard let forecast = forecast
            else    {
                fatalError("Error passing the forecast object, DailyForecastWrapper")
        }
        
        detailForecastView.configureView(forecast: forecast)
    }

}
