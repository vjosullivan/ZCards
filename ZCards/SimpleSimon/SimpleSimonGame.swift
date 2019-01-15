//
//  SimpleSimonGame.swift
//  ZCards
//
//  Created by Vincent O'Sullivan on 31/12/2018.
//  Copyright © 2018 Vincent O'Sullivan. All rights reserved.
//

import Foundation

class SimpleSimon {
    
    private var columns = [Deck]()
    
    init() {
        var deck = Deck(type: .shuffled)
        for _ in 0..<10 {
            columns.append(Deck(type: .empty))
        }
        for limit in [10, 9, 8, 7, 6, 5, 4, 3] {
            for index in 0..<limit {
                columns[index].add(deck.drawTopCard(), to: .topOfDeck)
            }
        }
        for i in 0..<10 {
            print("Col \(i): \(columns[i].count)")
        }
        for c in columns {
            print(c)
        }
    }
//
//    init?(decks: [Deck]) {
//        guard decks.count == 8 else {
//            return nil
//        }
//    }
}
