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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}
