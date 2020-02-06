//
//  ZipCodeForecast.swift
//  WeatherApp
//
//  Created by Juan Ceballos on 2/2/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import Foundation

struct ZipCodeForecast: Decodable  {
    // high
    // low
    // sunrise
    // sunset
    // wind speed
    // inches of precipitation
    let daily: DailyWrapper
}

struct DailyWrapper: Decodable  {
    let data: [DailyForecastWrapper]
}

struct DailyForecastWrapper: Decodable   {
    let time: Int
    let summary: String
    let icon: String
    let sunriseTime: Int
    let sunsetTime: Int
    let temperatureHigh: Double
    let temperatureLow: Double
    let windSpeed: Double
    let precipAccumulation: Double?
    
    var timeToDate: String    {
        let date = Date(timeIntervalSince1970: TimeInterval(time))
               let dateFormatter = DateFormatter()
               dateFormatter.timeStyle = DateFormatter.Style.medium
               dateFormatter.dateStyle = DateFormatter.Style.medium
               dateFormatter.timeZone = .current
               dateFormatter.dateFormat = "EEEE, MMM d"//EEEE, MMM d, yyyy, hh:mm a"
               let localDate = dateFormatter.string(from: date)
               return localDate
    }
}
