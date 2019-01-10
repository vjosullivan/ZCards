//
//  DeckSequenceTests.swift
//  ZCardsTests
//
//  Created by Vincent O'Sullivan on 10/01/2019.
//  Copyright © 2019 Vincent O'Sullivan. All rights reserved.
//

import XCTest
@testable import ZCards

class DeckSequenceTests: XCTestCase {

    private var deck = Deck(type: .empty)

    private let cardAS = Card(rank: .Ace, suit: .Spades)
    private let card2S = Card(rank: .Two, suit: .Spades)
    private let card3S = Card(rank: .Three, suit: .Spades)
    private let card4S = Card(rank: .Four, suit: .Spades)
    private let card7S = Card(rank: .Seven, suit: .Spades)
    private let card7D = Card(rank: .Seven, suit: .Diamonds)

    override func setUp() {
        deck = Deck(type: .empty)
    }

    func testZeroCardDeck() {
        XCTAssertEqual(0, deck.sequenceLength(.sameSuit, order: .ascending))
    }

    func testOneCardDeck() {
        deck.addToTop(cardAS)
        XCTAssertEqual(1, deck.sequenceLength(.sameSuit, order: .ascending))
    }

    // Tests for "same suit" sequences.

    func testSameSuitSequenceDiffRankDiffSuit() {
        deck.addToTop(card7D)
        deck.addToTop(cardAS)
        XCTAssertEqual(1, deck.sequenceLength(.sameSuit, order: .ascending))
    }

    func testSameSuitSequenceDiffRankSameSuit() {
        deck.addToTop(card7S)
        deck.addToTop(cardAS)
        XCTAssertEqual(1, deck.sequenceLength(.sameSuit, order: .ascending))
    }

    func testSameSuitSequenceNextRankSameSuit() {
        deck.addToTop(card2S)
        deck.addToTop(cardAS)
        XCTAssertEqual(2, deck.sequenceLength(.sameSuit, order: .ascending))
    }

    func testSameSuitSequenceLongButNotAll() {
        deck.addToTop(card7D)
        deck.addToTop(card4S)
        deck.addToTop(card3S)
        deck.addToTop(card2S)
        deck.addToTop(cardAS)
        XCTAssertEqual(4, deck.sequenceLength(.sameSuit, order: .ascending))
    }

    func testSameSuitSequenceLongAllCardsInDeck() {
        deck.addToTop(card4S)
        deck.addToTop(card3S)
        deck.addToTop(card2S)
        deck.addToTop(cardAS)
        XCTAssertEqual(4, deck.sequenceLength(.sameSuit, order: .ascending))
    }
}
