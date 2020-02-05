//
//  UserInfo.swift
//  WeatherApp
//
//  Created by Juan Ceballos on 2/3/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import Foundation

struct UserInfoKey  {
    static let zipCodeEntry = "zipcode"
    static let city = "city"
    static let time = "time"
}

class UserInfo  {
    private init() {}
    private let standard = UserDefaults.standard
    static let shared = UserInfo()
    
    func updateZipcode(zipCode: String)    {
        standard.set(zipCode, forKey: UserInfoKey.zipCodeEntry)
    }
    
    func getZipCode() -> String?   {
        guard let zipCode = standard.object(forKey: UserInfoKey.zipCodeEntry) as? String
            else    {
                return nil
        }
        return zipCode
    }
    
    func updateCity(city: String)   {
        standard.set(city, forKey: UserInfoKey.city)
    }
    
    func getCity()  -> String?  {
        guard let cityName = standard.object(forKey: UserInfoKey.city) as? String
            else    {
                return nil
        }
        return cityName
    }
    
    func updateTime(time: String)   {
        standard.set(time, forKey: UserInfoKey.time)
    }
    
    func getTime()  -> String?  {
        guard let timeName = standard.object(forKey: UserInfoKey.time) as? String
            else    {
                return nil
        }
        return timeName
    }
}


