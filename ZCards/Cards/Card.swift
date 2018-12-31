//
//  Card.swift
//  ZCards
//
//  Created by Vincent O'Sullivan on 30/12/2018.
//  Copyright © 2018 Vincent O'Sullivan. All rights reserved.
//

import Foundation

struct Card {
    var rank: Rank
    var suit: Suit
}

extension Card: Equatable {
    
}

extension Card: CustomStringConvertible {
    var description: String {
        return "\(rank) of \(suit)"
    }
}
