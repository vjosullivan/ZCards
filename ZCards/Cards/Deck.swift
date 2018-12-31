//
//  Deck.swift
//  ZCards
//
//  Created by Vincent O'Sullivan on 30/12/2018.
//  Copyright © 2018 Vincent O'Sullivan. All rights reserved.
//

import Foundation

struct Deck {

    var cards: [Card]

    init(type: DeckType) {


        switch type {
        case .empty:
            cards = [Card]()
        case .sorted:
            cards = Deck.populate()
        case .shuffled:
            cards = Deck.populate()
            cards.shuffle()
        }
    }

    private static func populate() -> [Card] {
        var orderedDeck = [Card]()
        for s in Suit.allCases {
            for r in Rank.allCases {
                orderedDeck.append(Card(rank: r, suit: s))
            }
        }
        return orderedDeck
    }
}

enum DeckType {
    case empty
    case sorted
    case shuffled
}
