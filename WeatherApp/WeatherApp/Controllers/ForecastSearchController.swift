//
//  ViewController.swift
//  WeatherApp
//
//  Created by David Rifkin on 10/8/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import UIKit
import DataPersistence

class ForecastSearchController: UIViewController {
    
    public var dataPersistence: DataPersistence<PhotoObject>!
    
    private let forecastSearchView = ForecastSearchView()
    private let detail = DetailForecastViewController()
    
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
        forecastSearchView.forecastCollectionView.delegate = self
        forecastSearchView.zipcodeTextField.delegate = self
        forecastSearchView.zipcodeTextField.text = UserInfo.shared.getZipCode()
        updateUI()
    }
    
    func updateUI()  {
        print(UserInfo.shared.getZipCode() ?? "")
        ZipCodeHelper.getLatLong2(fromZipCode: UserInfo.shared.getZipCode() ?? "") { [weak self] (result) in
            switch result   {
            case .failure(let zipError):
                print(zipError)
            case .success(let latLongTuple):
                UserInfo.shared.updateCity(city: latLongTuple.placeName)
                ZipCodeForecastAPI.fetchForeCast(latLong: latLongTuple) { (result) in
                    switch result   {
                    case .failure(let appError):
                        print(appError)
                    case .success(let forecast):
                        self?.zipcodeForecast = forecast.daily.data
                        print(forecast.daily.data)
                    }
                }
            }
        }
    }
}

extension ForecastSearchController: UICollectionViewDelegate    {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let forecastItem = zipcodeForecast[indexPath.row]
        
        detail.forecast = forecastItem
        detail.dataPersistence = dataPersistence
        
        self.navigationController?.pushViewController(detail, animated: true)
        print("this was clicked")
        
    }
}

extension ForecastSearchController: UICollectionViewDataSource  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return zipcodeForecast.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "forecastCell", for: indexPath) as! ForecastCVCell
        let forecast = zipcodeForecast[indexPath.row]
        forecastSearchView.cityForecastLabel.text = "Weather Forecast for \(UserInfo.shared.getCity() ?? "")"
        
        UserInfo.shared.updateLowTemp(lowTemp: forecast.temperatureLow.description)
        
        cell.configureCell(forecast: forecast)
        return cell
    }
    
}

extension ForecastSearchController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        forecastSearchView.zipcodeTextField.resignFirstResponder()
        let latLong = textField.text ?? ""
        print(latLong)
        UserInfo.shared.updateZipcode(zipCode: latLong)
        ZipCodeHelper.getLatLong2(fromZipCode: latLong) { (result) in
            switch result   {
            case .failure(let zipError):
                print(zipError)
            case .success(let latLongTuple):
                print(latLongTuple)
                UserInfo.shared.updateCity(city: latLongTuple.placeName.replacingOccurrences(of: " ", with: ""))
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

