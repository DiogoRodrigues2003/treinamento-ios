//
//  ViewController.swift
//  Jogo da Memoria
//
//  Created by Locação on 20/07/22.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private let defaultCardImage = UIImage(named: "default")
    private let allCardsRange = 0...9
    private let topCardsRange = 0...4
    private let bottomCardsRange = 5...9
    
    lazy var cards: [CardItemView] = {
        var list: [CardItemView] = [CardItemView]()
        for i in allCardsRange {
            let card = CardItemView(cardType: memoryGame.cards[i], id: i + 1)
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
        restart.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(buttonResetClick)))
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
        buildCardsOnStackViews()
        buildConstrainst()
        
        memoryGame.delegate = self
    }
    
    @objc func buttonResetClick() {
        reset()
    }
    
    func reset() {
        memoryGame = MemoryGame()
        memoryGame.delegate = self
        
        rebuildCards()
    }
    
    func rebuildCards() {
        for i in allCardsRange {
            cards[i].clicked = false
            cards[i].cardType = memoryGame.cards[i]
            cards[i].imageView.image = defaultCardImage
        }
    }
    
    func alert(title: String, description: String? = nil) {
        let alert = UIAlertController(title: title, message: description, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Bacana, bora de novo", style: .default) { _ in
            self.reset()
        }
        
        alert.addAction(action)
        
        present(alert, animated: true)
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
    
    func buildCardsOnStackViews() {
        for i in topCardsRange {
            topCardsStackView.addArrangedSubview(cards[i])
        }
        for i in bottomCardsRange {
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
    
    func wrongAttempt(firstClick: Int, secondClick: Int) {
        self.cards[firstClick].clicked = false
        self.cards[secondClick].clicked = false
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            UIView.transition(with: self.cards[firstClick].imageView, duration: 0.5, options: .transitionFlipFromRight, animations: {
                self.cards[firstClick].imageView.image = self.defaultCardImage
            }, completion: nil)
            
            UIView.transition(with: self.cards[secondClick].imageView, duration: 0.5, options: .transitionFlipFromLeft, animations: {
                self.cards[secondClick].imageView.image = self.defaultCardImage
            }, completion: nil)
        }
    }
    
    func victory() {
        alert(title: "Boa, você terminou!", description: "Você precisou de \(memoryGame.tries) tentativas para finalizar o jogo da memória.")
    }
}

