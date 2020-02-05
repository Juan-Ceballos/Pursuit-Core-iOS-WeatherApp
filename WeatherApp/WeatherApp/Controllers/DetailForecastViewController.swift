//
//  DetailForecastViewController.swift
//  WeatherApp
//
//  Created by Juan Ceballos on 2/4/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit

class DetailForecastViewController: UIViewController {

    private let detailForecastView = DetailForecastView()
    
    override func loadView()    {
        view = detailForecastView
    }
    
    var forecast: DailyForecastWrapper?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        updateUI()
    }
    
    func updateUI() {
        guard let forecast = forecast
            else    {
                fatalError("Error passing the forecast object, DailyForecastWrapper")
        }
        
        detailForecastView.configureView(forecast: forecast)
    }

}
