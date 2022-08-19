
import Foundation
import UIKit

extension UIViewController {
    
    func removeBackButtonLabel() {
        navigationItem.backBarButtonItem = .init(title: "", style: .plain, target: nil, action: nil)
    }
    
    func configureNavigationBar() {
        navigationController?.navigationBar.tintColor = .white
                                                     
        let barAppearance = UIBarAppearance()
        barAppearance.backgroundColor = Colors.base()
        
        let appearance = UINavigationBarAppearance(barAppearance: barAppearance)
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.titlePositionAdjustment = .init(horizontal: -CGFloat.greatestFiniteMagnitude, vertical: 0)
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    func showAlert(title: String, message: String) {
        DispatchQueue.main.async {
            let controller = UIAlertController(title: title, message: message, preferredStyle: .alert)
            self.present(controller, animated: true)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                controller.dismiss(animated: true)
            }
        }
    }
    
}

protocol LoadingIndicatorViewType: AnyObject {
    var loadingIndicatorViewController: UIViewController? { get set }
    func showLoadingIndicator()
    func hideLoadingIndicator()
}

extension LoadingIndicatorViewType where Self: UIViewController {
    
    func showLoadingIndicator() {
        let viewController = LoadingIndicatorViewController()
        loadingIndicatorViewController = viewController
        present(viewController, animated: true)
    }
    
    func hideLoadingIndicator() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
            self.loadingIndicatorViewController?.dismiss(animated: true)
            self.loadingIndicatorViewController = nil
        }
    }
}

enum CollectionViewLayoutConstants {
    static let horizontalSpacing: CGFloat = 16
    static let verticalSpacing: CGFloat = 20
    
    static func cellSize(basedOn collectionViewWidth: CGFloat) -> CGSize {
        .init(width: (collectionViewWidth - horizontalSpacing) / 2 - horizontalSpacing, height: 240)
    }
    
    static func userPetsCellSize(basedOn collectionViewWidth: CGFloat) -> CGSize {
        .init(width: (collectionViewWidth - horizontalSpacing) - horizontalSpacing, height: 190)
    }
}
