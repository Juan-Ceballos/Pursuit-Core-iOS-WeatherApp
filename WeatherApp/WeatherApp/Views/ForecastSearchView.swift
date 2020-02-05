//
//  ForecastSearchControllerView.swift
//  WeatherApp
//
//  Created by Juan Ceballos on 1/31/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit

class ForecastSearchView: UIView {
    
    public let defaultMessage = "Default Message"
    private let placeHolderText = "ZipCode"
    
    public lazy var forecastCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 200, height: 200)
        let forecastCV = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        forecastCV.register(ForecastCVCell.self, forCellWithReuseIdentifier: "forecastCell")
        forecastCV.backgroundColor = .systemTeal
        return forecastCV
    }()
    
    public lazy var cityForecastLabel: UILabel = {
        let label = UILabel()
        label.text = UserInfo.shared.getCity()
        label.textAlignment = .center
        return label
    }()
    
    public lazy var zipCodeLabel: UILabel = {
        let label = UILabel()
        label.text = "Enter a Zip Code"
        return label
    }()
    
    public lazy var zipcodeTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = placeHolderText
        textField.backgroundColor = .systemGray
        textField.textAlignment = .center
        return textField
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
        setupcityForecastLabel()
        setupForecastCollectionViewConstraints()
        setupZipCodeTextField()
        setupZipCodeLabel()
    }
    
    private func setupForecastCollectionViewConstraints()   {
        addSubview(forecastCollectionView)
        forecastCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            forecastCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            forecastCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            forecastCollectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 80),
            forecastCollectionView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.25)
        ])
    }
    
    private func setupcityForecastLabel()    {
        addSubview(cityForecastLabel)
        cityForecastLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            cityForecastLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            cityForecastLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            cityForecastLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20)
        ])
    }
    
    private func setupZipCodeTextField()    {
        addSubview(zipcodeTextField)
        zipcodeTextField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            zipcodeTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            zipcodeTextField.topAnchor.constraint(equalTo: forecastCollectionView.bottomAnchor, constant: 40),
            zipcodeTextField.widthAnchor.constraint(equalToConstant: 110)
        ])
    }
    
    private func setupZipCodeLabel()    {
        addSubview(zipCodeLabel)
        zipCodeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            zipCodeLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            zipCodeLabel.topAnchor.constraint(equalTo: zipcodeTextField.bottomAnchor, constant: 20)
        ])
    }
    
}
