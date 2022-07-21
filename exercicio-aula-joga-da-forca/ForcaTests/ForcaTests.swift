//
//  ForcaTests.swift
//  ForcaTests
//
//  Created by Locação on 19/07/22.
//

import XCTest
@testable import Forca

class ForcaTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_troca() {
        var mascara = "____"
        let palavra = "mula"
        
        mascara = troca(letra: "m", na: mascara, original: palavra)
        XCTAssertEqual("m___", mascara)
        
        mascara = troca(letra: "u", na: mascara, original: palavra)
        XCTAssertEqual("mu__", mascara)
        
        mascara = troca(letra: "x", na: mascara, original: palavra)
        XCTAssertEqual("mu__", mascara)
    }

}
