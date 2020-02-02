//
//  ForecastSearchControllerView.swift
//  WeatherApp
//
//  Created by Juan Ceballos on 1/31/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit

class ForecastSearchView: UIView {
    
    public lazy var forecastCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 200, height: 200)
        let forecastCV = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        forecastCV.register(ForecastCVCell.self, forCellWithReuseIdentifier: "forecastCell")
        forecastCV.backgroundColor = .systemTeal
        return forecastCV
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
        setupForecastCollectionViewConstraints()
    }
    
    private func setupForecastCollectionViewConstraints()   {
        addSubview(forecastCollectionView)
        forecastCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        
            forecastCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            forecastCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            forecastCollectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            forecastCollectionView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.25)
        ])
    }
    
}
