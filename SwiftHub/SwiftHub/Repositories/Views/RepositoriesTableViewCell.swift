//
//  RepositoriesTableViewCell.swift
//  SwiftHub
//
//  Created by Locação on 31/07/22.
//

import Foundation
import UIKit
import Rswift

class RepositoriesTableViewCell: UITableViewCell {
    
    static let reuseIdentifier: ReuseIdentifier<RepositoriesTableViewCell> = ReuseIdentifier(identifier: "repository-cell")
    
    lazy var capsuleImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    lazy var infosView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var infoItemView: InfoItemView = {
        let view = InfoItemView()
        return view
    }()
    
    lazy var starCountLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(13)
        return label
    }()
    
    lazy var ownerView: UIStackView = {
        let view = UIStackView()
        view.backgroundColor = .red
        view.axis = .vertical
        view.alignment = .center
        return view
    }()
    
    lazy var ownerImageView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 50
        view.clipsToBounds = true
        return view
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
    
    func setup(with repository: Repository) {
        infoItemView.titleLabel.text = repository.name
        infoItemView.textLabel.text = repository.description
        starCountLabel.text = String(repository.starCount) + "⭐️"
        
        ownerImageView.loadImage(from: repository.owner.pictureURL)
    }
}

extension RepositoriesTableViewCell {
    func configViews() {
        backgroundColor = .white
    }

    func buildViews() {
        contentView.addSubview(infosView)
        contentView.addSubview(ownerView)

        infosView.addSubview(infoItemView)
        infosView.addSubview(starCountLabel)
        
        ownerView.addArrangedSubview(ownerImageView)
    }

    func buildConstraints() {
        
        infosView.snp.makeConstraints { make in
            make.top.bottom.leading.equalToSuperview()
            make.width.equalTo(285)
        }
        
        ownerView.snp.makeConstraints { make in
            make.top.trailing.bottom.equalToSuperview()
            make.width.equalTo(90)
        }
        
        infoItemView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.bottom.equalTo(starCountLabel.snp.top)
        }
        
        starCountLabel.snp.makeConstraints { make in
            make.top.equalTo(infoItemView.snp.bottom)
            make.leading.equalToSuperview().offset(11)
            make.bottom.equalToSuperview().inset(8)
        }
        
        ownerImageView.snp.makeConstraints { make in
            make.size.equalTo(60)

        }
        
    }
}
