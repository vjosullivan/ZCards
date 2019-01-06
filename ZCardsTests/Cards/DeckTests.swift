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
    
    func testSortedTopCard() {
        let d = Deck(type: .sorted)
        XCTAssertEqual(52, d.count, "A new sorted deck should have fiftytwo cards.")
        XCTAssertEqual(aceOfClubs, d.topCard, "The first card should be the Ace of Clubs.")
        XCTAssertEqual(52, d.count, "Deck should still have 52 cards after peeking at the top card.")
    }
    
    func testRemoveTopCard() {
        var d = Deck(type: .sorted)
        let drawnCard = d.drawTopCard()
        XCTAssertEqual(51, d.count, "A full deck with one card drawn should have fiftyone cards.")
        XCTAssertEqual(aceOfClubs, drawnCard, "The drawn card should be the Ace of Clubs.")
        XCTAssertEqual(twoOfClubs, d.topCard, "The next top card should be the Two of Clubs.")
    }

    /// A shuffled deck should contain 52 different cards.
    func testDeckSequence() {
        let deck = Deck(type: .shuffled)
        var prevCard: Card? = nil
        for card in deck {
            XCTAssertNotEqual(prevCard, card)
            prevCard = card
        }
    }

    /// A shuffled deck should contain no cards.
    func testDeckEmptySequence() {
        let deck = Deck(type: .empty)
        for _ in deck {
            XCTFail()
        }
    }

    func testInsertRemoveTopCard() {
        let card = Card(rank: .Ace, suit: .Spades)
        var deck = Deck(type: .empty)
        XCTAssertEqual(0, deck.count)
        deck.addToTop(card)
        XCTAssertEqual(1, deck.count)
        let newCard = deck.drawTopCard()
        XCTAssertEqual(0, deck.count)
        XCTAssertEqual(card, newCard)
    }

    func testEmptyDeckString() {
        XCTAssertEqual("Empty deck", Deck(type: .empty).description)
    }

    func testBottomInsert() {
        let cardAS = Card(rank: .Ace, suit: .Spades)
        let card2S = Card(rank: .Two, suit: .Spades)
        var deck = Deck(type: .empty)
        XCTAssertEqual(0, deck.count)
        deck.add(cardAS, to: .topOfDeck)
        deck.add(card2S, to: .bottomOfDeck)
        XCTAssertEqual(2, deck.count)
        let card1 = deck.drawTopCard()
        let card2 = deck.drawTopCard()
        XCTAssertEqual(cardAS, card1)
        XCTAssertEqual(card2S, card2)
    }
}
