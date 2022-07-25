//
//  FavoritesViewController.swift
//  Nospresso
//
//  Created by Treinamento on 22/07/22.
//

import UIKit

class FavoritesViewController: UIViewController {
    
    let presenter: FavoritesPresenterProtocol
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configViews()
        buildViews()
        buildConstraints()
    }
    
    init(presenter: FavoritesPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configViews() {
        view.backgroundColor = .red
    }
    
    func buildViews() {
        
    }
    
    func buildConstraints() {
        
    }

}

extension FavoritesViewController: FavoritesViewControllerProtocol {
    
}
