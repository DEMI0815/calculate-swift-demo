//
//  Concentration.swift
//  Concentration
//
//  Created by Yidi Zhao on 2019/10/11.
//  Copyright © 2019 Yidi Zhao. All rights reserved.
//

import Foundation

class Concentration {
    
    var cards = [Card]()
    
    var indexOfOneAndOnlyOneFaceUp: Int? {
        get {
            var foundIndex: Int?
            for index in cards.indices {
                if cards[index].isFaceUp {
                    if foundIndex == nil {
                        foundIndex = index
                    } else {
                        return nil
                    }
                }
            }
            return foundIndex
        }
        
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    func chooseCard(index: Int) {
        if !cards[index].isMatch {
            if let matchIndex = indexOfOneAndOnlyOneFaceUp, matchIndex != index {
                if cards[matchIndex].id == cards[index].id {
                    cards[matchIndex].isMatch = true
                    cards[index].isMatch = true
                }
                cards[index].isFaceUp = true
//                indexOfOneAndOnlyOneFaceUp = nil
            } else {
//                for flipCard in cards.indices {
//                    cards[flipCard].isFaceUp = false
//                }
//                cards[index].isFaceUp = true
                indexOfOneAndOnlyOneFaceUp = index
            }
        }
    }
    
    init(number: Int) {
        for _ in 1...number {
            let card = Card()
            cards += [card,card]
        }
    
    }
    
}
