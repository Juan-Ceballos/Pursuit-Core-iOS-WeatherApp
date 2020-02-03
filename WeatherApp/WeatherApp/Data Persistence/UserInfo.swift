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
}


