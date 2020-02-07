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
    
    static func fetchForeCast(latLong: (lat: Double, long: Double, placeName: String), completion: @escaping (Result<ZipCodeForecast, AppError>) -> ()) {
        let endpointURL = "https://api.darksky.net/forecast/\(SecreetKeys.forcastKey)/\(latLong.lat),\(latLong.long)"
        
        guard let url = URL(string: endpointURL)
            else    {
                completion(.failure(.badURL(endpointURL)))
                return
        }
        
        let urlRequest = URLRequest(url: url)
   
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
