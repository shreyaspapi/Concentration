//
//  Card.swift
//  Concentration
//
//  Created by Shreyas on 08/09/19.
//  Copyright © 2019 Shreyas. All rights reserved.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMatched = false
    var isUsed = false
    var identifier: Int
    
    static var identifierFactor = 0
    
    static func getUniqueCardIdentifier() -> Int {
        identifierFactor += 1
        return identifierFactor
    }
    
    init() {
        self.identifier = Card.getUniqueCardIdentifier()
    }
    
}
