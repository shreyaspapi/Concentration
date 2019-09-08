//
//  Concentration.swift
//  Concentration
//
//  Created by Shreyas on 08/09/19.
//  Copyright © 2019 Shreyas. All rights reserved.
//

import Foundation

class Concentration {
    var cards = [Card]()
    var indexOfOneAndOnlyOneFaceUpCard: Int?
    var score = 0
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyOneFaceUpCard, matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                    score += 2
                } else {
                    if cards[index].isUsed{
                        score -= 1
                    }
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyOneFaceUpCard = nil
            } else {
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyOneFaceUpCard = index
                cards[index].isUsed = true
            }
        }
    }
    
    func resetDefault() {
        indexOfOneAndOnlyOneFaceUpCard = nil
        for buttonIndex in cards.indices {
            cards[buttonIndex].isMatched = false
            cards[buttonIndex].isFaceUp = false
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        for _ in 0..<numberOfPairsOfCards {
            let card = Card()
            cards.insert(card, at: Int(arc4random_uniform(UInt32(cards.count))))
            cards.insert(card, at: Int(arc4random_uniform(UInt32(cards.count))))
        }
        
    }
}
