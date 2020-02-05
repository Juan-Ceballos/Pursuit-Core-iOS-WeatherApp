//
//  FavoritesView.swift
//  WeatherApp
//
//  Created by Juan Ceballos on 2/5/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit

class DetailForecastView: UIView    {
    
    private lazy var forecastInfoStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [highTempLabel, lowTempLabel, sunriseLabel, sunsetLabel, windspeedLabel, precipInchesLabel])
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.spacing = 8
        return stackView
    }()
    
    func configureView(forecast: DailyForecastWrapper)    {
        highTempLabel.text = forecast.temperatureHigh.description
        lowTempLabel.text = forecast.temperatureLow.description
        sunriseLabel.text = forecast.sunriseTime.description
        sunsetLabel.text = forecast.sunsetTime.description
        windspeedLabel.text = forecast.windSpeed.description
        precipInchesLabel.text = forecast.precipAccumalation?.description
        
    }
    
    private lazy var sunriseLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    private lazy var lowTempLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var highTempLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var sunsetLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var windspeedLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var precipInchesLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var cityLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var weatherSummaryLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var cityImage: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit()   {
        setupWeatherInfoStackView()
    }
    
    private func setupWeatherInfoStackView()    {
        addSubview(forecastInfoStackView)
        
        forecastInfoStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
            forecastInfoStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            forecastInfoStackView.centerYAnchor.constraint(equalTo: centerYAnchor)
        
        ])
    }
    
}
