//
//  CityPhotoAPI.swift
//  WeatherApp
//
//  Created by Juan Ceballos on 2/6/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import Foundation
import NetworkHelper

class CityPhotoAPI  {
    static func getCityPhoto(city: String, secretKey: String, completion: @escaping (Result<CityPhoto, AppError>) -> ())  {
        let endpointURL = "https://pixabay.com/api/?key=\(secretKey)&q=\(city)&city&image_type=photo"
        
        guard let url = URL(string: endpointURL)
            else    {
                return
        }
        let urlRequest = URLRequest(url: url)
        
        NetworkHelper.shared.performDataTask(with: urlRequest) { (result) in
            switch result   {
            case .failure(let appError):
                print(appError)
            case .success(let data):
                do  {
                    let cityPhoto = try JSONDecoder().decode(CityPhoto.self, from: data)
                    completion(.success(cityPhoto))
                }
                
                catch   {
                    completion(.failure(.decodingError(error)))
                }
            }
        }
    }
}
