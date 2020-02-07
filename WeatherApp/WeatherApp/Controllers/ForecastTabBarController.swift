//
//  ForecastTabBarController.swift
//  WeatherApp
//
//  Created by Juan Ceballos on 2/4/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit

class ForecastTabBarController: UITabBarController {

    private lazy var forecastSCVC: ForecastSearchController = {
        let viewController = ForecastSearchController()
        viewController.tabBarItem = UITabBarItem(title: "Forecast", image: UIImage(systemName: "magnifyingglass"), tag: 0)
        return viewController
        
    }()
    
    private lazy var favoritesVC: FavoritesViewController = {
        let viewController = FavoritesViewController()
        viewController.tabBarItem = UITabBarItem(title: "Favorites", image: UIImage(systemName: "star.fill"), tag: 1)
        return viewController
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [UINavigationController(rootViewController: forecastSCVC), favoritesVC]
    
    }

}
