//
//  Card.swift
//  Concentration
//
//  Created by Yidi Zhao on 2019/10/11.
//  Copyright © 2019 Yidi Zhao. All rights reserved.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMatch = false
    private var id: Int
    
    private static var identifierFactor = 0
    
    private static func getIdentifier() -> Int {
        identifierFactor += 1
        return identifierFactor
    }
    
    init() {
        self.id = Card.getIdentifier()
    }
    
}

extension Card: Hashable {
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.id == rhs.id
    }
}
