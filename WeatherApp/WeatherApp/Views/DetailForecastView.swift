//
//  FavoritesView.swift
//  WeatherApp
//
//  Created by Juan Ceballos on 2/5/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit
import ImageKit

class DetailForecastView: UIView    {
    
    private lazy var forecastInfoStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [highTempLabel, lowTempLabel, sunriseLabel, sunsetLabel, windspeedLabel, precipInchesLabel])
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.spacing = 2
        return stackView
    }()
    
    func configureView(forecast: DailyForecastWrapper)    {
        highTempLabel.text = forecast.temperatureHigh.description
        lowTempLabel.text = forecast.temperatureLow.description
        sunriseLabel.text = forecast.sunriseTime.description
        sunsetLabel.text = forecast.sunsetTime.description
        windspeedLabel.text = forecast.windSpeed.description
        precipInchesLabel.text = forecast.precipAccumulation?.description
        cityLabel.text = "Weather Forecast For \(UserInfo.shared.getCity() ?? ""), \(forecast.timeToDate)"
        weatherSummaryLabel.text = forecast.summary
        
        CityPhotoAPI.getCityPhoto(city: UserInfo.shared.getCity() ?? "", secretKey: SecreetKeys.pixabayKey) { [weak self] (result) in
            switch result   {
            case .failure(let appError):
                print(appError)
            case .success(let cityPhotoURL):
                let randomImageNumber = Int.random(in: 0 ..< cityPhotoURL.hits.count)
                DispatchQueue.main.async {
                    self?.cityImage.getImage(with: cityPhotoURL.hits[randomImageNumber].largeImageURL) { (result) in
                        switch result   {
                        case .failure(let appError):
                            print(appError)
                        case .success(let cityPhoto):
                            DispatchQueue.main.async {
                                self?.cityImage.image = cityPhoto
                            }
                        }
                    }
                }
                
            }
        }
        
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
        label.textAlignment = .center
        return label
    }()
    
    private lazy var weatherSummaryLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    public lazy var cityImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
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
        setupCityLabel()
        setupCityImageConstraints()
        setupWeatherSummaryConstraint()
        setupWeatherInfoStackView()
    }
    
    private func setupCityLabel()   {
        addSubview(cityLabel)
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        
            cityLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            cityLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            cityLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
        ])
    }
    
    private func setupCityImageConstraints()    {
        addSubview(cityImage)
        
        cityImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            cityImage.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 20),
            cityImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            cityImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            cityImage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5)
        ])
    }
    
    private func setupWeatherSummaryConstraint()    {
        addSubview(weatherSummaryLabel)
        
        weatherSummaryLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
            weatherSummaryLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            weatherSummaryLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            weatherSummaryLabel.topAnchor.constraint(equalTo: cityImage.bottomAnchor, constant: 8),
        ])
    }
    
    private func setupWeatherInfoStackView()    {
        addSubview(forecastInfoStackView)
        
        forecastInfoStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            forecastInfoStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            forecastInfoStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            forecastInfoStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -8),
            forecastInfoStackView.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
    
}
