//
//  CoffeesPresenter.swift
//  Nospresso
//
//  Created by Locação on 26/07/22.
//

import Foundation
import UIKit

internal class CoffeesPresenter: NSObject {

    internal weak var view: CoffeesViewProtocol?
    internal var repository: CoffeesRepositoryInputProtocol
    internal var coordinator: CoffeesCoordinatorProtocol
    
    private var capsules: [Capsule] = []
    
    internal init(repository: CoffeesRepositoryInputProtocol,
                  coordinator: CoffeesCoordinatorProtocol) {
        self.repository = repository
        self.coordinator = coordinator
    }
}

// MARK: - Presenter Protocol
extension CoffeesPresenter: CoffeesPresenterProtocol {
    func viewDidLoad() {
        view?.showLoadingIndicator()
        repository.getCoffees()
    }
}
// MARK: - Repository Output
extension CoffeesPresenter: CoffeesRepositoryOutputProtocol {
    func getCoffeesSuccess(with capsules: [Capsule]) {
        self.capsules = capsules
        
        DispatchQueue.main.async {
            self.view?.reload()
            self.view?.hideLoadingIndicator()
        }
    }
    
    func getCoffeesFailure(with error: APIError) {
        DispatchQueue.main.async {
            self.view?.showAlert(title: "Erro", message: "Deu erro na chamada")
        }
    }
}

extension CoffeesPresenter: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = CoffeeTableViewHeader()
        view.setUp(category: capsules[section].category)
        return view
    }
}

extension CoffeesPresenter: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        capsules.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        capsules[section].coffees.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CoffeeTableViewCell.reuseIdentifier, for: indexPath)!
        
        let coffee = capsules[indexPath.section].coffees[indexPath.row]
        
        cell.setup(with: coffee)
        
        return cell
    }
}
