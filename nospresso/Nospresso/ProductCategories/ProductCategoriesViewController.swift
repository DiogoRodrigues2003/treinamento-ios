//
//  ProductCategoriesViewController.swift
//  Nospresso
//
//  Created by Treinamento on 21/07/22.
//

import UIKit

class ProductCategoriesViewController: UIViewController {
    
    let presenter: ProductCategoriesPresenterProtocol
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    lazy var coffeesCategoryView: ProductCategoriesItemView = {
        let view = ProductCategoriesItemView(type: .coffees)
        view.delegate = self
        return view
    }()
    
    lazy var machinesCategoryView: ProductCategoriesItemView = {
        let view = ProductCategoriesItemView(type: .machines)
        view.delegate = self
        return view
    }()
    
    lazy var accessoriesCategoryView: ProductCategoriesItemView = {
        let view = ProductCategoriesItemView(type: .accessories)
        view.delegate = self
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configViews()
        buildViews()
        buildConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    init(presenter: ProductCategoriesPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configViews() {
        removeBackButtonLabel()
        view.backgroundColor = Colors.cafes()
    }
    
    func buildViews() {
        view.addSubview(stackView)
        
        stackView.addArrangedSubview(coffeesCategoryView)
        stackView.addArrangedSubview(machinesCategoryView)
        stackView.addArrangedSubview(accessoriesCategoryView)
    }
    
    func buildConstraints() {
        stackView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide.snp.edges)
        }
    }

}

extension ProductCategoriesViewController: ProductCategoriesViewControllerProtocol {
    
}

extension ProductCategoriesViewController: ProductCategoriesItemViewDelegateProtocol {
    
    func touched(type: ProductCategoriesItemViewType) {
        switch type {
        case .coffees:
            presenter.coffeesTouched()
        case .machines:
            presenter.machinesTouched()
        case .accessories:
            presenter.accessoriesTouched()
        }
    }
    
}
