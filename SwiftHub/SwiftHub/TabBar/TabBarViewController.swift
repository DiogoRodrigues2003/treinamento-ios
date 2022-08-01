//
//  TabBarViewController.swift
//  SwiftHub
//
//  Created by Locação on 29/07/22.
//

import Foundation
import UIKit

class TabBarViewController: UITabBarController {
    
    private var repositories: UIViewController {
        let navigation = UINavigationController()
        navigation.tabBarItem = .init(title: "Mobile Repositories", image: UIImage(systemName: "star"), tag: 0)
        
        let viewController = RepositoriesCoordinator.createModule(navigationController: navigation)
        
        navigation.viewControllers = [viewController]
        
        return navigation
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [repositories]
    }
    
}
