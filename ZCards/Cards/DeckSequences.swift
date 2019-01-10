//
//  DeckCardSequences.swift
//  ZCards
//
//  Created by Vincent O'Sullivan on 06/01/2019.
//  Copyright © 2019 Vincent O'Sullivan. All rights reserved.
//

import Foundation

enum SequenceType {
    case sameSuit
}

enum SequenceOrder {
    case ascending
}

extension Deck {

    public func sequenceLength(_ sequenceType: SequenceType, order: SequenceOrder = .ascending) -> Int {
        guard count > 1 else { return count }

        var sequenceCount = 1
        switch sequenceType {
        case .sameSuit:
            var previousCard = deck.first! // Guard statement ensures deck contains at least two cards.
            for card in deck.dropFirst() {
                if card.suit != previousCard.suit {
                    return sequenceCount
                }
                if card.rank != previousCard.rank.next {
                    return sequenceCount
                }
                sequenceCount += 1
                previousCard = card
            }
        }
        return sequenceCount
    }
}

extension CaseIterable where Self: Equatable {
    var next: Self {
        let all = Self.allCases
        let idx = all.index(of: self)!
        let next = all.index(after: idx)
        return all[next == all.endIndex ? all.startIndex : next]
    }
}
