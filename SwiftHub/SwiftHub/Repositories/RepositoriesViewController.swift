//
//  RepositoriesViewController.swift
//  SwiftHub
//
//  Created by Locação on 29/07/22.
//

import Foundation
import UIKit

class RepositoriesViewController: UIViewController {

    private let presenter: RepositoriesPresenterProtocol
    
    lazy var swiftLanguageItemView: LanguageItemView = {
        let view = LanguageItemView(type: .swift, repositories: true)
        view.clicked = true
        return view
    }()
    
    lazy var kotlinLanguageItemView: LanguageItemView = {
        let view = LanguageItemView(type: .kotlin, repositories: true)
        return view
    }()
    
    lazy var objCLanguageItemView: LanguageItemView = {
        let view = LanguageItemView(type: .objC, repositories: true)
        return view
    }()
    
    lazy var javaLanguageItemView: LanguageItemView = {
        let view = LanguageItemView(type: .java, repositories: true)
        return view
    }()
    
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.showsHorizontalScrollIndicator = false
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(named: "conservative")?.cgColor
        return view
    }()
    
    lazy var languagesStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 8
        view.alignment = .center
        return view
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorInset = .zero
        
        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = 0
        }
        
        return tableView
    }()
    
    internal init(presenter: RepositoriesPresenterProtocol) {
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
        
        presenter.viewDidLoad(language: "swift")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.tintColor = .label
                                                     
        let barAppearance = UIBarAppearance()
        barAppearance.backgroundColor = UIColor(named: "main")
        
        let appearance = UINavigationBarAppearance(barAppearance: barAppearance)
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.titlePositionAdjustment = .init(horizontal: -CGFloat.greatestFiniteMagnitude, vertical: 0)
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }

}

// MARK: view
extension RepositoriesViewController {
    func configViews() {
        
        tableView.delegate = presenter
        tableView.dataSource = presenter
        tableView.register(RepositoriesTableViewCell.self, forCellReuseIdentifier: RepositoriesTableViewCell.reuseIdentifier.identifier)
        
        title = "Repositories"
        view.backgroundColor = .white
    }
    
    func buildViews() {
        view.addSubview(scrollView)
        view.addSubview(tableView)

        scrollView.addSubview(languagesStackView)

        languagesStackView.addArrangedSubview(swiftLanguageItemView)
        languagesStackView.addArrangedSubview(kotlinLanguageItemView)
        languagesStackView.addArrangedSubview(objCLanguageItemView)
        languagesStackView.addArrangedSubview(javaLanguageItemView)
    }
    
    func buildConstraints() {
        
        scrollView.snp.makeConstraints { make in
            make.top.trailing.leading.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(tableView.snp.top)
            make.height.equalTo(70)
        }
        
        languagesStackView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(8)
            make.height.equalTo(70)
        }
        
        tableView.snp.makeConstraints { make in
            make.trailing.leading.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

// MARK: - RepositoriesViewControllerProtocol
extension RepositoriesViewController: RepositoriesViewProtocol {
    
    func reload() {
        tableView.reloadData()
    }
}
