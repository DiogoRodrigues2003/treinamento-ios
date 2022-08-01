//
//  Repositories.swift
//  SwiftHub
//
//  Created by Locação on 29/07/22.
//

import Foundation
import UIKit

class RepositoriesPresenter: NSObject {

    weak var view: RepositoriesViewProtocol?
    var repository: RepositoriesRepositoryInputProtocol
    var coordinator: RepositoriesCoordinatorProtocol
    
    private var repositories: [Repository] = []
    
    internal init(repository: RepositoriesRepositoryInputProtocol,
                  coordinator: RepositoriesCoordinatorProtocol) {
        self.repository = repository
        self.coordinator = coordinator
    }
}

// MARK: - Presenter Protocol
extension RepositoriesPresenter: RepositoriesPresenterProtocol {
    
    func viewDidLoad(language: String) {
        repository.getRepositories(language: language)
    }
    
}
// MARK: - Repository Output
extension RepositoriesPresenter: RepositoriesRepositoryOutputProtocol {
    func getRepositoriesSuccess(with repositories: [Repository]) {
        self.repositories = repositories
        
        DispatchQueue.main.async {
            self.view?.reload()
        }
    }
    
    func getRepositoriesFailure(with error: APIError) {
        DispatchQueue.main.async {
            self.view?.showAlert(title: "Error", message: "A error has ocurred.")
        }
    }
}

extension RepositoriesPresenter: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let coffee = capsules[indexPath.section].coffees[indexPath.row]
//
//        coordinator.openCoffeeDetails(using: coffee)
//    }
}

extension RepositoriesPresenter: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        repositories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RepositoriesTableViewCell.reuseIdentifier, for: indexPath)!
        
        cell.setup(with: repositories[indexPath.item])
        
        return cell
    }
}
