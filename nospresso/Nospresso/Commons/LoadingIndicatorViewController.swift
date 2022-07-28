//
//  LoadingIndicatorViewController.swift
//  Nospresso
//
//  Created by Locação on 27/07/22.
//

import Foundation
import UIKit

class LoadingIndicatorViewController: UIViewController {
    
    lazy var containerView: UIView = {
       let view = UIView()
        view.backgroundColor = Colors.cinzaSobreposicao()
        view.layer.cornerRadius = 10
        return view
    }()
    
    lazy var indicatorView: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .large)
        view.color = .white
        view.startAnimating()
        return view
    }()
    
    convenience init() {
        self.init(nibName: nil, bundle: nil)
        
        modalPresentationStyle = .overFullScreen
        modalTransitionStyle = .crossDissolve
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configViews()
        buildViewa()
        buildConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
}


extension LoadingIndicatorViewController {
    
    func configViews() {
        view.backgroundColor = Colors.pretoSobreposicao()
    }
    
    func buildViewa() {
        view.addSubview(containerView)
        
        containerView.addSubview(indicatorView)
    }
    
    func buildConstraints() {
        containerView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(150)
        }
        
        indicatorView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(50)
        }
    }
}
