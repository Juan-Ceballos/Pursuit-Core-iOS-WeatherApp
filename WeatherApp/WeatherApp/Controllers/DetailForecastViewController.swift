//
//  DetailForecastViewController.swift
//  WeatherApp
//
//  Created by Juan Ceballos on 2/4/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit

class DetailForecastViewController: UIViewController {

    var forecast: DailyForecastWrapper?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
        print(forecast?.temperatureLow)
    }
    
    


}
