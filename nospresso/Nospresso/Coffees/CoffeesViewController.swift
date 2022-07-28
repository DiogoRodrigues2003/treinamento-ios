//
//  CoffeesViewController.swift
//  Nospresso
//
//  Created by Locação on 26/07/22.
//

import Foundation
import UIKit

internal class CoffeesViewController: UIViewController, LoadingIndicatorViewType {
    
    var loadingIndicatorViewController: UIViewController?

    private let presenter: CoffeesPresenterProtocol
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorInset = .zero
        
        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = 0
        }
        
        return tableView
    }()

    internal init(presenter: CoffeesPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    internal required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configViews()
        buildViews()
        buildConstraints()
        
        presenter.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
            
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.tintColor = .label
        
        let barAppearance = UIBarAppearance()
        barAppearance.backgroundColor = Colors.cafes()
        
        let appearance = UINavigationBarAppearance(barAppearance: barAppearance)
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }

}

// MARK: view
extension CoffeesViewController {
    func configViews() {
        title = Localizable.coffees()
        
        tableView.delegate = presenter
        tableView.dataSource = presenter
        tableView.register(CoffeeTableViewCell.self, forCellReuseIdentifier: CoffeeTableViewCell.reuseIdentifier.identifier)
        
        removeBackButtonLabel()
        view.backgroundColor = Colors.cafes()
    }
    
    func buildViews() {
        view.addSubview(tableView)
    }
    
    func buildConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide.snp.edges)
        }
    }
}

// MARK: - CoffeesViewControllerProtocol
extension CoffeesViewController: CoffeesViewProtocol {
    func reload() {
        tableView.reloadData()
    }
}
