//
//  Deck.swift
//  ZCards
//
//  Created by Vincent O'Sullivan on 30/12/2018.
//  Copyright © 2018 Vincent O'Sullivan. All rights reserved.
//

import Foundation

struct Deck {

    private var deck: [Card]
    
    var count: Int {
        return deck.count
    }
    
    var topCard: Card {
        return deck[0]
    }

    init(type: DeckType) {

        switch type {
        case .empty:
            deck = [Card]()
        case .sorted:
            deck = Deck.populated()
        case .shuffled:
            deck = Deck.populated().shuffled()
        }
    }
    
    public mutating func drawTopCard() -> Card {
        return deck.remove(at: 0)
    }
    
    public mutating func addToTop(_ card: Card) {
        deck.insert(card, at: 0)
    }
    
    public mutating func add(_ card: Card, to location: DeckLocation) {
        switch location {
        case .topOfDeck:
            deck.insert(card, at: 0)
        case .bottomOfDeck:
            deck.append(card)
        }
    }
    
    private static func populated() -> [Card] {
        var orderedDeck = [Card]()
        for s in Suit.allCases {
            for r in Rank.allCases {
                orderedDeck.append(Card(rank: r, suit: s))
            }
        }
        return orderedDeck
    }
}

extension Deck: CustomStringConvertible {
    var description: String {
        if self.count == 0 {
            return "Empty deck"
        }
        return "\(self.count) cards: \(deck)"
            
    }
}

enum DeckType {
    case empty
    case sorted
    case shuffled
}

enum DeckLocation {
    case topOfDeck
    case bottomOfDeck
}
