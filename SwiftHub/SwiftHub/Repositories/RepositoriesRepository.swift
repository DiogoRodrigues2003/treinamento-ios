//
//  RepositoriesRepository.swift
//  SwiftHub
//
//  Created by Locação on 29/07/22.
//

import Foundation
import UIKit

class RepositoriesRepository {
    
    internal weak var output: RepositoriesRepositoryOutputProtocol?
    let api = Requester()
}

// MARK: - Repository Input
extension RepositoriesRepository: RepositoriesRepositoryInputProtocol {
    func getRepositories(language: String) {
        let urlProvider = SearchAPIURLProvider(endpoint: .search(language: language))
        Requester.request(search: urlProvider) { [weak self] (result: Result<RepositoriesFullData, APIError>) in
            switch result {
                case .success(let data):
                    self?.output?.getRepositoriesSuccess(with: data.repositories)
                case .failure(let error):
                    self?.output?.getRepositoriesFailure(with: error)
            }
        }
    }
}
