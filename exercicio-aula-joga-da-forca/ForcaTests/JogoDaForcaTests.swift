//
//  JogoDaForcaTests.swift
//  ForcaTests
//
//  Created by Locação on 21/07/22.
//

import XCTest
@testable import Forca

class JogoDaForcaTests: XCTestCase {

    // SYSTEM UNDER TEST
    var sut: JogoDaForca?
    
    override func setUp() {
        sut = .init(palavra: "abelha", dica: "inseto")
    }
    
    func test_tentar_withTwoLettersRight_whenTryingAnotherRightLetter_shouldNotHaveAnyErrors() throws {
        // Given
        let sut = try XCTUnwrap(sut)
        sut.tentar(letra: "a")
        sut.tentar(letra: "b")
        
        // When
        sut.tentar(letra: "e")
        
        // Then
        XCTAssertEqual(sut.erros, 0)
    }
    
    func test_tentar_withTwoLettersRight_whenTryingWrongLetter_shouldHaveOneError() throws {
        // Given
        let sut = try XCTUnwrap(sut)
        sut.tentar(letra: "a")
        sut.tentar(letra: "b")
        
        // When
        sut.tentar(letra: "X")
        
        // Then
        XCTAssertEqual(sut.erros, 1)
    }
}
