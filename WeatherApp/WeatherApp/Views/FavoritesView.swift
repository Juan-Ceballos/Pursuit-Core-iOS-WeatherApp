//
//  FavoritesView.swift
//  WeatherApp
//
//  Created by Juan Ceballos on 2/6/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit
import ImageKit

class FavoritesView: UIView    {
    
    public lazy var favoritesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 400, height: 400)
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.register(FavoritesCell.self, forCellWithReuseIdentifier: "favoritesCell")
        collectionView.backgroundColor = .red
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit()   {
       setupCollectionViewConstraints()
    }
    
    private func setupCollectionViewConstraints()   {
        addSubview(favoritesCollectionView)
        
        favoritesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
            favoritesCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            favoritesCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            favoritesCollectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            favoritesCollectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
            
        ])
    }
    
}
