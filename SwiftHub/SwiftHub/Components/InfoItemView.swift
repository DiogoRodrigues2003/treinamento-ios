//
//  InfoItemView.swift
//  SwiftHub
//
//  Created by Locação on 31/07/22.
//

import Foundation
import UIKit
import SnapKit
import Rswift
import SwiftUI

class InfoItemView: UIView {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = R.font.openSansBold(size: 17)
        return label
    }()
    
    lazy var textLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(11)
        label.numberOfLines = 2
        label.textColor = UIColor(named: "conservative")
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        
        configViews()
        buildViews()
        buildConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configViews() {
        backgroundColor = .white
        
    }
    
    func buildViews() {
        addSubview(titleLabel)
        addSubview(textLabel)
    }
    
    func buildConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.top.equalToSuperview().offset(13)
            make.leading.equalToSuperview().offset(14)
        }
        
        textLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.leading.equalTo(titleLabel)
            make.top.equalTo(titleLabel.snp.bottom).offset(3)
        }
    }
    
}
