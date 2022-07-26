//
//  ViewController.swift
//  Jogo da Memoria
//
//  Created by Locação on 20/07/22.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    lazy var cards: [CardItemView] = {
        var list: [CardItemView] = [CardItemView]()
        for i in 0...9 {
            let card = CardItemView(cardType: memoryGame.cards[i], id: i)
            card.delegate = self
            list.append(card)
        }
        
        return list
    }()
    
    lazy var restartStackView: UIStackView = {
        let restart = UIStackView()
        restart.axis = .horizontal
        restart.alignment = .center
        restart.spacing = 10
        return restart
    }()
    
    lazy var restartLabel: UILabel = {
        let label = UILabel()
        label.text = "Reiniciar"
        label.font = label.font.withSize(33)
        return label
    }()
    
    lazy var restartImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "restart-icon")
        return image
    }()
    
    lazy var topCardsStackView: UIStackView = {
        let top = UIStackView()
        top.axis = .horizontal
        top.alignment = .center
        top.spacing = 23
        return top
    }()
    
    lazy var bottomCardsStackView: UIStackView = {
        let top = UIStackView()
        top.axis = .horizontal
        top.alignment = .center
        top.spacing = 23
        return top
    }()
    
    private var memoryGame = MemoryGame()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        configViews()
        buildViews()
        buildCards()
        buildConstrainst()
        
        memoryGame.delegate = self
    }
    
    @objc func buttonResetClick() {
        
    }
    
    func update() {
        
    }


}

// MARK: - views setup

extension ViewController {
    
    func configViews(){
        view.backgroundColor = .white
    }
    
    func buildViews() {
        view.addSubview(restartStackView)
        restartStackView.addArrangedSubview(restartLabel)
        restartStackView.addArrangedSubview(restartImageView)
        
        view.addSubview(topCardsStackView)
        view.addSubview(bottomCardsStackView)
        
    }
    
    func buildCards() {
        for i in 0...4 {
            topCardsStackView.addArrangedSubview(cards[i])
        }
        for i in 5...9 {
            bottomCardsStackView.addArrangedSubview(cards[i])
        }
    }
    
    func buildConstrainst() {
        restartStackView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(30)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(50)
            
        }
        
        topCardsStackView.snp.makeConstraints { make in
            make.top.equalTo(restartStackView.snp.bottom).offset(40)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(50)
        }
        
        bottomCardsStackView.snp.makeConstraints { make in
            make.top.equalTo(topCardsStackView.snp.bottom).offset(25)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(50)
        }
        
    }
}

extension ViewController: CardItemViewDelegateProtocol {
    func touched(cardType: String, id: Int) {
        memoryGame.cardClick(cardType: cardType, id: id)
    }
}

extension ViewController: MemoryGameDelegateProtocol {
    
    func round(firstClick: Int, secondClick: Int) {
        cards[firstClick].imageView.image = UIImage(named: "default")
        cards[secondClick].imageView.image = UIImage(named: "default")
    }
}

