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
        for c in columns {
            print(c)
        }
    }

    /// Moves one or more cards from one column to another.
    /// The card must be eligible to move for the move to succeed.
    ///
    /// - Parameters:
    ///   - from: Source column.
    ///   - to: Destination column.
    func moveCard(from: Int, to: Int) {
        guard columns[from].count > 0 else { return }
    }
}

extension Deck {

    /// Returns the count of cards from the top of the deck that are in sequence.
    /// To be in sequence they must be in the same suit and in ascending order from
    /// the top.
    ///
    /// - Example: (Top of Deck)  3H, 3C, 5D (Bottom) - Sequence = 1
    ///            (Top of Deck)  3H, 4H, 5H (Bottom) - Sequence = 3
    ///
    ///
    /// - Returns: <#return value description#>
    private func suitSequeneCount() -> Int {
        guard self.count > 1 else { return self.count }
            return 0
//        for card in self {
//
//        }
    }
}
