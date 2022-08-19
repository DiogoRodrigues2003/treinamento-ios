
import Foundation
import UIKit

class TabBarViewController: UITabBarController {
    
    private var petBreeds: UIViewController {
        let navigation = UINavigationController()
        navigation.tabBarItem = .init(title: Localizable.petBreeds(), image: UIImage(systemName: "magnifyingglass"), tag: 0)
        
        let viewController = HomeCoordinator.createModule(using: navigation)

        navigation.viewControllers = [viewController]
        
        return navigation
    }
    
    private var userPets: UIViewController {
        let navigation = UINavigationController()
        navigation.tabBarItem = .init(title: Localizable.userPetsTitle(), image: UIImage(systemName: "heart"), tag: 1)

        let viewController = UserPetsCoordinator.createModule(using: navigation)

        navigation.viewControllers = [viewController]

        return navigation
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = Colors.base()
        
        tabBar.standardAppearance = appearance
        tabBar.scrollEdgeAppearance = appearance
        
        tabBar.tintColor = Colors.darkerBase2()
        tabBar.unselectedItemTintColor = .white
        
        viewControllers = [petBreeds, userPets]
    }

}
