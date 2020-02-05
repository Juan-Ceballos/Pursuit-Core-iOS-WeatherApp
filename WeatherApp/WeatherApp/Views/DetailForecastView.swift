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
        return stackView
    }()
    
    private lazy var sunriseLabel: UILabel = {
        let label = UILabel()
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
    
}
