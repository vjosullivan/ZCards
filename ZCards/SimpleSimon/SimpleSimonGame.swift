//
//  SimpleSimonGame.swift
//  ZCards
//
//  Created by Vincent O'Sullivan on 31/12/2018.
//  Copyright © 2018 Vincent O'Sullivan. All rights reserved.
//

import Foundation

class SimpleSimon {
    
    private var columns = [[Card]]()
    
    init() {
        var deck = Deck(type: .shuffled)
        for _ in 0..<10 {
            columns.append([Card]())
        }
        for limit in [10, 9, 8, 7, 6, 5, 4, 3] {
            for index in 0..<limit {
                print(index)
                columns[index].append(deck.drawTopCard())
            }
        }
        for c in columns {
            print(c.count, c)
        }
    }
}
