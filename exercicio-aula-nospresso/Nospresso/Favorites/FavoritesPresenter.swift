//
//  FavoritesPresenter.swift
//  Nospresso
//
//  Created by Treinamento on 22/07/22.
//

import Foundation

class FavoritesPresenter {
    
    weak var view: FavoritesViewControllerProtocol?
    let coordinator: FavoritesCoordinatorProtocol
    
    init(coordinator: FavoritesCoordinatorProtocol) {
        self.coordinator = coordinator
    }
    
}

extension FavoritesPresenter: FavoritesPresenterProtocol {
    
}
