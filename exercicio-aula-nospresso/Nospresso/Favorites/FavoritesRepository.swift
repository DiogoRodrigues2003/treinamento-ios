//
//  FavoritesRepository.swift
//  Nospresso
//
//  Created by Treinamento on 22/07/22.
//

import Foundation

class FavoritesRepository {
    
    weak var output: FavoritesRepositoryOutputProtocol?
    
}

extension FavoritesRepository: FavoritesRepositoryInputProtocol {
    
}
