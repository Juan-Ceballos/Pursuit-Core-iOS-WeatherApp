//
//  DetailForecastViewController.swift
//  WeatherApp
//
//  Created by Juan Ceballos on 2/4/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit

class DetailForecastViewController: UIViewController {

    private let detailForecastView = DetailForecastView()
    
    override func loadView()    {
        view = detailForecastView
    }
    
    var dataPersistence = PersistenceHelper(filename: "cityPhotos.plist")
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
    
    @objc func favorite() {
        if let imageData = detailForecastView.cityImage.image?.jpegData(compressionQuality: 0.5){
            let imageObject = PhotoObject(imageData: imageData)
            do  {
                try dataPersistence.create(event: imageObject)
            }
            catch   {
            }
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
