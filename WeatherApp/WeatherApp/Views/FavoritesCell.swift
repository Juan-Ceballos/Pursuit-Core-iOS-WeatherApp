//
//  FavoritesCell.swift
//  WeatherApp
//
//  Created by Juan Ceballos on 2/6/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit

class FavoritesCell: UICollectionViewCell {
    
    public let favoritesReuseIdentifier = "favoritesCell"
    
    public lazy var favoritedImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit()   {
        setupImageConstraints()
    }
    
    private func setupImageConstraints()    {
        addSubview(favoritedImage)
        
        favoritedImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
            favoritedImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            favoritedImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            favoritedImage.topAnchor.constraint(equalTo: topAnchor),
            favoritedImage.bottomAnchor.constraint(equalTo: bottomAnchor)
        
        ])
    }
    
}
