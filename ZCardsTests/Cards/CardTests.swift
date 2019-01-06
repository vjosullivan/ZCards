//
//  CardTests.swift
//  ZCardsTests
//
//  Created by Vincent O'Sullivan on 06/01/2019.
//  Copyright © 2019 Vincent O'Sullivan. All rights reserved.
//

import XCTest
@testable import ZCards

class CardTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCardsEqual() {
        let card3Sa = Card(rank: .Three, suit: .Spades)
        let card3Sb = Card(rank: .Three, suit: .Spades)
        XCTAssertEqual(card3Sa, card3Sb)
    }

    func testCardsUnequalRank() {
        let card3S = Card(rank: .Three, suit: .Spades)
        let card4S = Card(rank: .Four, suit: .Spades)
        XCTAssertNotEqual(card3S, card4S)
    }

    func testCardsUnequalSuit() {
        let card3S = Card(rank: .Three, suit: .Spades)
        let card3D = Card(rank: .Three, suit: .Diamonds)
        XCTAssertNotEqual(card3S, card3D)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
