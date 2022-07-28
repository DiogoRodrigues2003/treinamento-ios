//
//  CoffeeTableViewHeader.swift
//  Nospresso
//
//  Created by Locação on 27/07/22.
//

import Foundation
import UIKit

class CoffeeTableViewHeader: UIView {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.openSansLightItalic(size: 21)
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        
        configViews()
        buildViews()
        buildConstraints()
    }
    
    func setUp(category: String) {
        titleLabel.text = category
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension CoffeeTableViewHeader {
    
    func configViews() {
        backgroundColor = Colors.fundoCinza()
    }
    
    func buildViews() {
        addSubview(titleLabel)
    }
    
    func buildConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.trailing.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(8)
        }
    }
}
