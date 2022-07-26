//
//  ProductCategoriesRepository.swift
//  Nospresso
//
//  Created by Treinamento on 21/07/22.
//

import Foundation

class ProductCategoriesRepository {
    
    weak var output: ProductCategoriesRepositoryOutputProtocol?
    
}

extension ProductCategoriesRepository: ProductCategoriesRepositoryInputProtocol {
    
}
