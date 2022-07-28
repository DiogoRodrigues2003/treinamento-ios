//
//  CoffeeTableViewCell.swift
//  Nospresso
//
//  Created by Locação on 26/07/22.
//

import Foundation
import UIKit
import Rswift

class CoffeeTableViewCell: UITableViewCell {
    
    static let reuseIdentifier: ReuseIdentifier<CoffeeTableViewCell> = ReuseIdentifier(identifier: "coffee-cell")
    
    lazy var capsuleImageView: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.openSansSemiBold(size: 19)
        label.textColor = Colors.textoCinza()
        
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.openSansLightItalic(size: 12)
        label.textColor = Colors.textoCinzaDiscreto()
        
        return label
    }()
    
    lazy var intensityLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.openSansLightItalic(size: 9)
        label.textColor = Colors.textoCinzaDiscreto()
        
        return label
    }()
    
    lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.openSansBold(size: 14)
        label.textColor = Colors.verdeClaro()
        
        return label
    }()
    
    lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 12
        stackView.axis = .vertical
        
        return stackView
    }()
    
    lazy var addToFavoritesButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.tintColor = Colors.vermelhoAmor()
        return button
    }()
    
    lazy var addToBagButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "bag.badge.plus"), for: .normal)
        button.tintColor = Colors.textoCinza()
        return button
    }()
    
    override public init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    
        configViews()
        buildViews()
        buildConstraints()
    }

    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(with coffee: Coffee) {
        capsuleImageView.loadImage(using: coffee.image)
        nameLabel.text = coffee.name
        descriptionLabel.text = coffee.description
        
        if let intensity = coffee.intensity {
            intensityLabel.text = Localizable.intensity(intensity)
        } else {
            intensityLabel.text = Localizable.intensityUnknown()
        }
        
        priceLabel.text = coffee.price.asMoney
    }
    
}

extension CoffeeTableViewCell {
    func configViews() {
        backgroundColor = .white
    }

    func buildViews() {
        contentView.addSubview(capsuleImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(intensityLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(buttonStackView)
        
        buttonStackView.addArrangedSubview(addToFavoritesButton)
        buttonStackView.addArrangedSubview(addToBagButton)
    }

    func buildConstraints() {
        capsuleImageView.snp.makeConstraints { make in
            make.size.equalTo(50)
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(18)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.leading.equalTo(capsuleImageView.snp.trailing).offset(22)
            make.top.equalToSuperview().offset(12)
            make.trailing.equalTo(buttonStackView.snp.leading)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.leading.equalTo(nameLabel)
            make.top.equalTo(nameLabel.snp.bottom).offset(8)
            make.trailing.equalTo(buttonStackView.snp.leading)
        }
        
        intensityLabel.snp.makeConstraints { make in
            make.leading.equalTo(nameLabel)
            make.top.equalTo(descriptionLabel.snp.bottom).offset(24)
            make.bottom.equalToSuperview().inset(12)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(12)
            make.leading.equalTo(intensityLabel.snp.trailing)
        }
        
        buttonStackView.snp.makeConstraints { make in
            make.leading.equalTo(priceLabel.snp.trailing).offset(10)
            make.trailing.equalToSuperview().inset(18)
            make.centerY.equalToSuperview()
        }
        
        addToFavoritesButton.snp.makeConstraints { make in
            make.size.equalTo(40)
        }
        
        addToBagButton.snp.makeConstraints { make in
            make.size.equalTo(40)
        }
    }
}
