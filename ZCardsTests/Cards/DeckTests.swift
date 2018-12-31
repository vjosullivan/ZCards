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

    let aceOfClubs = Card(rank: Rank.Ace,   suit: Suit.Clubs)
    let twoOfClubs = Card(rank: Rank.Two,   suit: Suit.Clubs)

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testNewEmptyDeck() {
        let d = Deck(type: .empty)
        XCTAssertEqual(0, d.count, "Empty deck should have zero cards.")
    }

    func testNewSortedDeck() {
        let d = Deck(type: .sorted)
        XCTAssertEqual(52, d.count, "A new sorted deck should have fiftytwo cards.")
        XCTAssertEqual(aceOfClubs, d.topCard, "The first card should be the Ace of Clubs.")
    }

    func testNewShuffledDeck() {
        let d = Deck(type: .shuffled)
        XCTAssertEqual(52, d.count, "A new sorted deck should have fiftytwo cards.")
        XCTAssertNotEqual(aceOfClubs, d.topCard, "The first card should not usually be the Ace of Clubs.")
    }
    
    func testTopCard() {
        let d = Deck(type: .sorted)
        XCTAssertEqual(52, d.count, "A new sorted deck should have fiftytwo cards.")
        XCTAssertEqual(aceOfClubs, d.topCard, "The first card should be the Ace of Clubs.")
        XCTAssertEqual(52, d.count, "Deck should still have 52 cards after peeking at the top card.")
    }
    
    func testRemoveTopCard() {
        var d = Deck(type: .sorted)
        let drawnCard = d.drawTopCard()
        XCTAssertEqual(51, d.count, "Deck with one card drawn should have fiftyone cards.")
        XCTAssertEqual(aceOfClubs, drawnCard, "The drawn card should be the Ace of Clubs.")
        XCTAssertEqual(twoOfClubs, d.topCard, "The next top card should be the Two of Clubs.")
    }
}
