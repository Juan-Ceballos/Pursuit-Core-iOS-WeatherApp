//
//  CityPhoto.swift
//  WeatherApp
//
//  Created by Juan Ceballos on 2/6/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import Foundation
struct CityPhoto: Decodable {
    let hits: [ImageWrapper]
}

struct ImageWrapper: Decodable  {
    let largeImageURL: String
}
