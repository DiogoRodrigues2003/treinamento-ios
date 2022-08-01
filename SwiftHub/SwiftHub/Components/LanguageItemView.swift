//
//  LanguageItemView.swift
//  SwiftHub
//
//  Created by Locação on 30/07/22.
//

import Foundation
import UIKit
import SnapKit

enum LanguageItemViewType: CaseIterable {
    case swift
    case kotlin
    case objC
    case java
    
    var title: String {
        switch self {
        case .swift:
            return "swift"
        case .kotlin:
            return "kotlin"
        case .objC:
            return "obj-c"
        case .java:
            return "java"
        }
    }
    
    var image: UIImage? {
        UIImage(named: self.title)
    }
    
}

protocol LanguageItemViewDelegateProtocol {
    //func touched(type: ProductCategoriesItemViewType)
}

class LanguageItemView: UIView {
    
    private let type: LanguageItemViewType
    
    var clicked = false
    var repositories: Bool
    
    var delegate: LanguageItemViewDelegateProtocol?
    
    lazy var infoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 13
        return stackView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(12)
        label.textColor = UIColor(named: "main")
        return label
    }()
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    init(type: LanguageItemViewType, repositories: Bool) {
        self.type = type
        self.repositories = repositories
        
        super.init(frame: .zero)
        
        configViews()
        buildViews()
        buildConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configViews() {
        isOpaque = false
        alpha = 0.5
        backgroundColor = .white
        layer.borderColor = UIColor(named: "main")?.cgColor
        layer.cornerRadius = 20
        layer.borderWidth = 1
        
        titleLabel.text = type.title
        imageView.image = type.image
        
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(touched)))
    }
    
    @objc func touched() {
        alpha = 1
        //delegate?.touched(type: type)
    }
    
    func buildViews() {
        addSubview(infoStackView)
        
        infoStackView.addArrangedSubview(imageView)
        infoStackView.addArrangedSubview(titleLabel)
    }
    
    func buildConstraints() {
        snp.makeConstraints { make in
            make.width.equalTo(100)
            make.height.equalTo(35)
        }
        
        infoStackView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        imageView.snp.makeConstraints { make in
            make.size.equalTo(25)
        }
    }
    
}
