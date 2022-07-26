//
//  HomeTabBarViewController.swift
//  Nospresso
//
//  Created by Treinamento on 22/07/22.
//

import Foundation
import UIKit

class HomeTabBarViewController: UITabBarController {
    
    private var productCategories: UIViewController {
        let navigation = UINavigationController()
        navigation.tabBarItem = .init(title: "Produtos", image: UIImage(systemName: "cart"), tag: 0)
        
        let viewController = ProductCategoriesCoordinator.createModule(using: navigation)
        
        navigation.viewControllers = [viewController]
        
        return navigation
    }
    
    private var favorites: UIViewController {
        let navigation = UINavigationController()
        navigation.tabBarItem = .init(title: "Favoritos", image: UIImage(systemName: "heart"), tag: 1)
        
        let viewController = FavoritesCoordinator.createModule()
        
        navigation.viewControllers = [viewController]
        
        return navigation
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [productCategories, favorites]
    }
    
}
