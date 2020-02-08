//
//  ZipCodeForecast.swift
//  WeatherApp
//
//  Created by Juan Ceballos on 2/2/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import Foundation

struct ZipCodeForecast: Codable & Equatable  {
    let daily: DailyWrapper
}

struct DailyWrapper: Codable & Equatable  {
    let data: [DailyForecastWrapper]
}

struct DailyForecastWrapper: Codable & Equatable   {
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
    
    var sunsetTimeConverted: String {
        let date = Date(timeIntervalSince1970: TimeInterval(sunsetTime))
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.medium
        dateFormatter.dateFormat = "h:mm a"
        dateFormatter.timeZone = .current
        let localDate = dateFormatter.string(from: date)
        return localDate
    }
    
    var sunriseTimeConverted: String    {
        let date = Date(timeIntervalSince1970: TimeInterval(sunriseTime))
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.medium
        dateFormatter.dateFormat = "h:mm a"
        dateFormatter.timeZone = .current
        let localDate = dateFormatter.string(from: date)
        return localDate
    }
}
