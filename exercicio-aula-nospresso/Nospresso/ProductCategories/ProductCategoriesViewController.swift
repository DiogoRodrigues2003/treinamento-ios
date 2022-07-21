//
//  ProductCategoriesViewController.swift
//  Nospresso
//
//  Created by Treinamento on 21/07/22.
//

import UIKit

class ProductCategoriesViewController: UIViewController {
    
    let presenter: ProductCategoriesPresenterProtocol

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
    
    init(presenter: ProductCategoriesPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension ProductCategoriesViewController: ProductCategoriesViewControllerProtocol {
    
}
