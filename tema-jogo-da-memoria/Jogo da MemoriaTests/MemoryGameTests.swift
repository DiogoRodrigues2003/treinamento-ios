//
//  MemoryGameTests.swift
//  Jogo da MemoriaTests
//
//  Created by Locação on 28/07/22.
//

import Foundation
import XCTest
@testable import Jogo_da_Memoria

class MemoryGameTests: XCTestCase {
    
    //SYSTEM UNDER TEST
    var sut: MemoryGame?
    
    override func setUp() {
        sut = .init()
    }
    
    func test_whenResettingClick_shouldEmptyClickTypes() throws {
        // Given
        let sut = try XCTUnwrap(sut)
        sut.firstClickType = "knight"
        sut.secondClickType = "wizard"
        
        // When
        sut.resetClicks()
        
        // Then
        XCTAssertEqual(sut.firstClickType, "")
        XCTAssertEqual(sut.secondClickType, "")
    }
    
    func test_withNoClickBefore_whenClick_shouldMakeAFirstClick() throws {
        // Given
        let sut = try XCTUnwrap(sut)
        let cardType = "knight"
        let id = 1
        
        // When
        sut.cardClick(cardType: cardType, id: id)
        
        // Then
        XCTAssertEqual(sut.firstClickType, cardType)
        XCTAssertEqual(sut.firstClickId, id)
    }
    
    func test_withAClickBefore_whenClick_shouldMakeAnAttempt() throws {
        // Given
        let sut = try XCTUnwrap(sut)
        sut.firstClickType = "knight"
        sut.firstClickId = 1
        
        let cardType = "wizard"
        let id = 2
        
        // When
        sut.cardClick(cardType: cardType, id: id)
        
        // Then
        XCTAssertEqual(sut.secondClickId, id)
        XCTAssertEqual(sut.secondClickType, "")
    }
    
    func test_whenClicksAreEqual_shouldBeADoneCardType() throws {
        // Given
        let sut = try XCTUnwrap(sut)
        sut.firstClickType = "knight"
        sut.secondClickType = "knight"
        
        // When
        sut.attempt()
        
        // Then
        XCTAssertTrue(sut.doneCards.contains("knight"))
    }
    
    func test_whenClicksAreDifferent_shouldAddOneTry() throws {
        // Given
        let sut = try XCTUnwrap(sut)
        sut.firstClickType = "knight"
        sut.secondClickType = "wizard"
        
        // When
        sut.attempt()
        
        // Then
        XCTAssertTrue(sut.tries == 1)
    }
}
