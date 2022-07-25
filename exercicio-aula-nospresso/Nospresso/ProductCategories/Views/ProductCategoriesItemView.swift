//
//  ProductCategoriesItemView.swift
//  Nospresso
//
//  Created by Treinamento on 22/07/22.
//

import Foundation
import UIKit
import SnapKit

enum ProductCategoriesItemViewType {
    case coffees
    case machines
    case accessories
    
    var color: UIColor? {
        switch self {
        case .coffees:
            return Colors.cafes()
        case .machines:
            return Colors.maquinas()
        case .accessories:
            return Colors.acessorios()
        }
    }
    
    var title: String {
        switch self {
        case .coffees:
            return Localizable.coffees()
        case .machines:
            return Localizable.machines()
        case .accessories:
            return Localizable.accessories()
        }
    }
    
    var description: String {
        switch self {
        case .coffees:
            return Localizable.coffeesDescription()
        case .machines:
            return Localizable.machinesDescription()
        case .accessories:
            return Localizable.accessoriesDescription()
        }
    }
    
    var image: UIImage? {
        switch self {
        case .coffees:
            return Images.capsulasInicio()
        case .machines:
            return Images.maquinaInicio()
        case .accessories:
            return Images.xicarasInicio()
        }
    }
}

protocol ProductCategoriesItemViewDelegateProtocol {
    func touched(type: ProductCategoriesItemViewType)
}

class ProductCategoriesItemView: UIView {
    
    private let type: ProductCategoriesItemViewType
    
    var delegate: ProductCategoriesItemViewDelegateProtocol?
    
    lazy var textsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.openSansBold(size: 26)
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.openSansLight(size: 14)
        return label
    }()
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    init(type: ProductCategoriesItemViewType) {
        self.type = type
        
        super.init(frame: .zero)
        
        configViews()
        buildViews()
        buildConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configViews() {
        backgroundColor = type.color
        titleLabel.text = type.title
        descriptionLabel.text = type.description
        imageView.image = type.image
        
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(touched)))
    }
    
    @objc func touched() {
        delegate?.touched(type: type)
    }
    
    func buildViews() {
        addSubview(textsStackView)
        addSubview(imageView)
        
        textsStackView.addArrangedSubview(titleLabel)
        textsStackView.addArrangedSubview(descriptionLabel)
    }
    
    func buildConstraints() {
        textsStackView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(26)
            make.bottom.equalToSuperview().inset(28)
        }
        
        imageView.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(10)
            make.centerY.equalToSuperview()
        }
    }
    
}
