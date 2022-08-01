//
//  RepositoriesProtocols.swift
//  SwiftHub
//
//  Created by Locação on 29/07/22.
//

import Foundation
import UIKit

// Presenter -> Coordinator
protocol RepositoriesCoordinatorProtocol {
    //func openCoffeeDetails(using coffee: Coffee)
}

// Presenter -> ViewController
protocol RepositoriesViewProtocol: AnyObject {
    func reload()
    func showAlert(title: String, message: String)
}

// ViewController -> Presenter
protocol RepositoriesPresenterProtocol: UITableViewDelegate, UITableViewDataSource {
    func viewDidLoad(language: String)
}

// Presenter -> Repository
protocol RepositoriesRepositoryInputProtocol {
    func getRepositories(language: String)
}

// Repository -> Presenter
protocol RepositoriesRepositoryOutputProtocol: AnyObject {
    func getRepositoriesSuccess(with repositories: [Repository])
    func getRepositoriesFailure(with error: APIError)
}
