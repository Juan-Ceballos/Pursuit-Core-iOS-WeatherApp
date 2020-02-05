//
//  ForecastCVCell.swift
//  WeatherApp
//
//  Created by Juan Ceballos on 1/31/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit

class ForecastCVCell: UICollectionViewCell {
    
    //public lazy var forecastCell = UICollectionViewCell()
    
    private let cellReuseIdentifier = "forecastCell"
    
    private lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    private lazy var lowLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    private lazy var highLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    private lazy var weatherImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    func configureCell(forecast: DailyForecastWrapper)    {
        lowLabel.text = forecast.temperatureLow.description
        highLabel.text = forecast.temperatureHigh.description
        weatherImage.image = UIImage(named: forecast.icon)
        timeLabel.text = forecast.timeToDate
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit()   {
        setupLabelConstraints()
        setupImageConstraints()
        setupCityLabel()
    }
    
    private func setupLabelConstraints()    {
        addSubview(lowLabel)
        addSubview(highLabel)
        lowLabel.translatesAutoresizingMaskIntoConstraints = false
        highLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
            lowLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            lowLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            lowLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0)
        
        ])
        
        NSLayoutConstraint.activate([
            highLabel.bottomAnchor.constraint(equalTo: lowLabel.topAnchor, constant: -8),
            highLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            highLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0)
        ])
    }
    
    private func setupImageConstraints()    {
        addSubview(weatherImage)
        weatherImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            weatherImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            weatherImage.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    private func setupCityLabel()   {
        addSubview(timeLabel)
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            timeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            timeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            timeLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            timeLabel.bottomAnchor.constraint(equalTo: weatherImage.topAnchor, constant: -8)
        ])
    }
}
