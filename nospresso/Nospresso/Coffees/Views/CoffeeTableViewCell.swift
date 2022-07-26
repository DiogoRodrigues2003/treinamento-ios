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
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.openSansSemiBold(size: 19)
        label.textColor = Colors.textoCinza()
        
        return label
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
        nameLabel.text = coffee.name
    }
    
}

extension CoffeeTableViewCell {
    func configViews() {
        backgroundColor = .white
    }

    func buildViews() {
        contentView.addSubview(nameLabel)
    }

    func buildConstraints() {
        nameLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
