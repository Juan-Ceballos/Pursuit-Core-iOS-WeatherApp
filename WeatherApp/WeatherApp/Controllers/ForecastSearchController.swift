//
//  ViewController.swift
//  WeatherApp
//
//  Created by David Rifkin on 10/8/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import UIKit

class ForecastSearchController: UIViewController {

    // enter a zipcode and display 7 Day Forecast
    
    // 3 controllers, main to enter zipcode and get collection view of weather forecast, city image with weather for day selected, favorite images tableview
    
    // make an instance of your view
    private let forecastSearchView = ForecastSearchView()
    private let forecastCVCell = ForecastCVCell()
    
    override func loadView() {
        view = forecastSearchView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        forecastSearchView.forecastCollectionView.dataSource = self
        forecastSearchView.zipcodeTextField.delegate = self
    }
}

extension ForecastSearchController: UICollectionViewDelegate    {
    
}

extension ForecastSearchController: UICollectionViewDataSource  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "forecastCell", for: indexPath) as! ForecastCVCell
        cell.backgroundColor = UIColor.systemOrange
        return cell
    }
    
    
}

extension ForecastSearchController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        forecastSearchView.zipcodeTextField.resignFirstResponder()
        return true
    }
}

