//
//  CoffeesRepository.swift
//  Nospresso
//
//  Created by Locação on 26/07/22.
//

import Foundation
import UIKit

internal class CoffeesRepository {

    internal weak var output: CoffeesRepositoryOutputProtocol?
    let api = API()

}

// MARK: - Repository Input
extension CoffeesRepository: CoffeesRepositoryInputProtocol {
    func getCoffees() {
        api.request(endpoint: .capsules) { [weak self] (capsules: [Capsule]) in
            self?.output?.getCoffeesSuccess(with: capsules)
        } failure: { [weak self] error in
            self?.output?.getCoffeesFailure(with: error)
        }
    }
}
