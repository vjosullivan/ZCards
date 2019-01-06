//
//  ShuffleCode.swift
//  ZCards
//
//  Created by Vincent O'Sullivan on 30/12/2018.
//  Copyright © 2018 Vincent O'Sullivan. All rights reserved.
//

import Foundation

// extend any Indexed collection to be able to shuffle (see http://stackoverflow.com/questions/24026510/how-do-i-shuffle-an-array-in-swift)
//extension Sequence {
//    /// Returns an array with the contents of this sequence, shuffled.
//    func shuffled() -> [Element] {
//        var result = Array(self)
//        result.shuffle()
//        return result
//    }
//}
//
//extension MutableCollection {
//    /// Shuffles the contents of this collection.
//    mutating func shuffle() {
//        let c = count
//        guard c > 1 else { return }
//
//        for (firstUnshuffled, unshuffledCount) in zip(indices, stride(from: c, to: 1, by: -1)) {
//            // Change `Int` in the next line to `IndexDistance` in < Swift 4.1
//            let d: Int = numericCast(arc4random_uniform(numericCast(unshuffledCount)))
//            let i = index(firstUnshuffled, offsetBy: d)
//            swapAt(firstUnshuffled, i)
//        }
//    }
//}
