//
//  ZipCodeForecastAPI.swift
//  WeatherApp
//
//  Created by Juan Ceballos on 2/2/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import Foundation
import NetworkHelper

class ZipCodeForecastAPI  {
    
    static func fetchForeCast(latLong: (lat: Double, long: Double), completion: @escaping (Result<ZipCodeForecast, AppError>) -> ()) {
        let endpointURL = "https://api.darksky.net/forecast/7622a00dde0c5e6478c2dd4c90286b39/\(latLong.lat),\(latLong.long)"
        
        guard let url = URL(string: endpointURL)
            else    {
                completion(.failure(.badURL(endpointURL)))
                return
        }
        
        let urlRequest = URLRequest(url: url)
        // [highLow, highLow, highLow]
        // url request with url request get and turn data to object
        NetworkHelper.shared.performDataTask(with: urlRequest) { (result) in
            switch result   {
            case .failure(let appError):
                print(appError)
            case .success(let data):
                do  {
                    let forecast = try JSONDecoder().decode(ZipCodeForecast.self, from: data)
                    completion(.success(forecast))
                }
                catch   {
                    completion(.failure(.decodingError(error)))
                }
            }
        }
        
    }
    
    
}
