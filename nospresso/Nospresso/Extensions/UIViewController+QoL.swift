//
//  UIViewController+QoL.swift
//  Nospresso
//
//  Created by Locação on 26/07/22.
//

import Foundation
import UIKit

extension UIViewController {
    func removeBackButtonLabel() {
        navigationItem.backBarButtonItem = .init(title: "", style: .plain, target: nil, action: nil)
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
        present(viewController, animated: false)
    }
    
    func hideLoadingIndicator() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
            self.loadingIndicatorViewController?.dismiss(animated: true)
            self.loadingIndicatorViewController = nil
        }
    }
}
