//
//  SimpleSimonGame.swift
//  ZCards
//
//  Created by Vincent O'Sullivan on 31/12/2018.
//  Copyright © 2018 Vincent O'Sullivan. All rights reserved.
//

import Foundation

class SimpleSimon {
    
    private var decks = [Deck]()
    
    init() {
        var deck = Deck(type: .shuffled)
        for _ in 0..<10 {
            decks.append(Deck(type: .empty))
        }
        for limit in [10, 9, 8, 7, 6, 5, 4, 3] {
            for index in 0..<limit {
                decks[index].add(deck.drawTopCard(), to: .topOfDeck)
            }
        }
        for c in decks {
            print(c)
        }
    }
}
