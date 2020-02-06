//
//  CityPhoto.swift
//  WeatherApp
//
//  Created by Juan Ceballos on 2/6/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import Foundation
struct CityPhoto: Decodable {
    let hit: [ImageWrapper]
}

struct ImageWrapper: Decodable  {
    let largeImageURL: String
}
