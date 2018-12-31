//
//  DeckTests.swift
//  ZCardsTests
//
//  Created by Vincent O'Sullivan on 30/12/2018.
//  Copyright © 2018 Vincent O'Sullivan. All rights reserved.
//

import XCTest
@testable import ZCards

class DeckTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testNewEmptyDeck() {
        let d = Deck(type: .empty)
        XCTAssertEqual(0, d.cards.count, "Empty deck should have zero cards.")
    }

    func testNewSortedDeck() {
        let d = Deck(type: .sorted)
        let c01 = Card(rank: Rank.Ace,   suit: Suit.Clubs)
        let c20 = Card(rank: Rank.Seven, suit: Suit.Diamonds)
        let c40 = Card(rank: Rank.Ace,   suit: Suit.Spades)
        XCTAssertEqual(52, d.cards.count, "A new sorted deck should have fiftytwo cards.")
        XCTAssertEqual(c01, d.cards[ 0], "The first card should be the Ace of Clubs.")
        XCTAssertEqual(c20, d.cards[19], "The twentieth card should be the Seven of Diamonds.")
        XCTAssertEqual(c40, d.cards[39], "The fortieth card should be the Ace of Spades.")
    }

    func testNewShuffledDeck() {
        let d = Deck(type: .shuffled)
        let c01 = Card(rank: Rank.Ace,   suit: Suit.Clubs)
        let c20 = Card(rank: Rank.Seven, suit: Suit.Diamonds)
        let c40 = Card(rank: Rank.Ace,   suit: Suit.Spades)
        XCTAssertEqual(52, d.cards.count, "A new sorted deck should have fiftytwo cards.")
        XCTAssertNotEqual(c01, d.cards[ 0], "The first card should not usually be the Ace of Clubs.")
        XCTAssertNotEqual(c20, d.cards[19], "The twentieth card should not usually be the Seven of Diamonds.")
        XCTAssertNotEqual(c40, d.cards[39], "The fortieth card should not usually be the Ace of Spades.")
    }
}
