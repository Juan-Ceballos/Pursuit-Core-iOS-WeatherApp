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
    
    var zipcodeForecast = [DailyForecastWrapper]()  {
        didSet  {
            DispatchQueue.main.async {
                self.forecastSearchView.forecastCollectionView.reloadData()
            }
        }
    }
    
    override func loadView() {
        view = forecastSearchView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        forecastSearchView.forecastCollectionView.dataSource = self
        forecastSearchView.zipcodeTextField.delegate = self
        forecastSearchView.zipcodeTextField.text = UserInfo.shared.getZipCode()
    }
}

extension ForecastSearchController: UICollectionViewDelegate    {
    
}

extension ForecastSearchController: UICollectionViewDataSource  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return zipcodeForecast.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "forecastCell", for: indexPath) as! ForecastCVCell
        //cell.backgroundColor = UIColor.systemOrange
        let forecast = zipcodeForecast[indexPath.row]
        
        // configure cell
        cell.configureCell(forecast: forecast)
        cell.layer.borderColor = UIColor.systemOrange.cgColor
        cell.layer.borderWidth = 5
        return cell
    }
    
}

// put forecast model in collection view, connect assets to icon in model, string
extension ForecastSearchController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        forecastSearchView.zipcodeTextField.resignFirstResponder()
        let latLong = textField.text ?? ""
        print(latLong)
        UserInfo.shared.updateZipcode(zipCode: latLong)
        ZipCodeHelper.getLatLong(fromZipCode: latLong) { (result) in
            switch result   {
            case .failure(let zipError):
                print(zipError)
            case .success(let latLongTuple):
                ZipCodeForecastAPI.fetchForeCast(latLong: latLongTuple) { (result) in
                    switch result   {
                    case .failure(let appError):
                        print(appError)
                    case .success(let forecast):
                        self.zipcodeForecast = forecast.daily.data
                        print(forecast.daily.data)
                    }
                }
            }
        }
        return true
    }
}

