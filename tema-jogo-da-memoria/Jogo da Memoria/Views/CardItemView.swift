//
//  CardItemView.swift
//  Jogo da Memoria
//
//  Created by Locação on 24/07/22.
//

import Foundation
import UIKit
import SnapKit

protocol CardItemViewDelegateProtocol {
    func touched(cardType: String, id: Int)
}

class CardItemView: UIView {
    
    let id: Int
    var cardType: String
    var clicked = false
    
    var delegate: CardItemViewDelegateProtocol?
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "default")
        return imageView
    }()
    
    init(cardType: String, id: Int) {
        self.id = id
        self.cardType = cardType
        
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
        layer.cornerRadius = 8
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOpacity = 1
        layer.shadowOffset = .zero
        layer.shadowRadius = 3
        
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(touched)))
    }
    
    @objc func touched() {
        if !clicked {
            UIView.transition(with: imageView, duration: 0.5, options: .transitionFlipFromLeft, animations: {
                self.imageView.image = UIImage(named: self.cardType)
            }, completion: nil)
            
            clicked = true
            delegate?.touched(cardType: cardType, id: id)
        }
    }
    
    func buildViews() {
        addSubview(imageView)
    }
    
    func buildConstraints() {
        snp.makeConstraints { make in
            make.size.equalTo(110)
        }
        imageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
