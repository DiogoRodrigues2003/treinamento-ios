//
//  MemoryGame.swift
//  Jogo da Memoria
//
//  Created by Locação on 24/07/22.
//

import Foundation

let cardTypes = ["knight", "wizard", "witch", "elf", "dwarf"]

protocol MemoryGameDelegateProtocol {
    func round(firstClick: Int, secondClick: Int)
}

class MemoryGame {
    
    private(set) var cards = ["knight", "wizard", "witch", "elf", "dwarf", "knight", "wizard", "witch", "elf", "dwarf",]
    
    private(set) var firstClickType = ""
    private(set) var firstClickId = -1
    private(set) var secondClickType = ""
    private(set) var secondClickId = -1
    private(set) var tries = 0
    
    var delegate: MemoryGameDelegateProtocol?
    
    
//    func round() {
//        if firstClickType != secondClickType {
//
//        }
//
//    }
    
    func cardClick(cardType: String, id: Int) {
        if !firstClickType.isEmpty && !secondClickType.isEmpty {
            delegate?.round(firstClick: firstClickId, secondClick: secondClickId)
            firstClickType = ""
            firstClickId = -1
            secondClickType = ""
            secondClickId = -1
        }

        if firstClickType.isEmpty {
            firstClickType = cardType
            firstClickId = id
        } else {
            secondClickType = cardType
            secondClickId = id
//            round()
        }
    }
    
    init() {
        cards.shuffle()
    }
    
}
