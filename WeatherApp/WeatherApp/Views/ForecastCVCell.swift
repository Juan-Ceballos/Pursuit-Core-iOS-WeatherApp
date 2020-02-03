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
    
    private lazy var highLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    func configureCell(forecast: DailyForecastWrapper)    {
        highLabel.text = forecast.temperatureHigh.description
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
    }
    
    private func setupLabelConstraints()    {
        addSubview(highLabel)
        highLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
            highLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            highLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        
        ])
    }
}
