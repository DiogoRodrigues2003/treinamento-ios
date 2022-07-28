//
//  MemoryGame.swift
//  Jogo da Memoria
//
//  Created by Locação on 24/07/22.
//

import Foundation

let cardTypes = ["knight", "wizard", "witch", "elf", "dwarf"]

protocol MemoryGameDelegateProtocol {
    func wrongAttempt(firstClick: Int, secondClick: Int)
    func victory()
}

class MemoryGame {
    
    private(set) var cards = ["knight", "wizard", "witch", "elf", "dwarf", "knight", "wizard", "witch", "elf", "dwarf",]
    var doneCards: [String] = []
    
    var firstClickType = ""
    var firstClickId = 0
    var secondClickType = ""
    var secondClickId = 0
    
    var tries = 0
    
    var delegate: MemoryGameDelegateProtocol?
    
    init() {
        cards.shuffle()
    }
    
    func cardClick(cardType: String, id: Int) {
        guard firstClickType.isEmpty else {
            secondClickType = cardType
            secondClickId = id
            attempt()
            return
        }
        firstClickType = cardType
        firstClickId = id
    }
    
    func attempt() {
        if firstClickType == secondClickType {
            doneCards.append(firstClickType)
            checkVictory()
        } else {
            tries += 1
            delegate?.wrongAttempt(firstClick: firstClickId - 1, secondClick: secondClickId - 1)
        }
        resetClicks()
    }
    
    func resetClicks() {
        firstClickType = ""
        secondClickType = ""
    }
    
    func checkVictory() {
        guard doneCards.count == cardTypes.count else {
            return
        }
        delegate?.victory()
    }
}
