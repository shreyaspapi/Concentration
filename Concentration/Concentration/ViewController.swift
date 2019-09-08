//
//  ViewController.swift
//  Concentration
//
//  Created by Shreyas on 05/09/19.
//  Copyright © 2019 Shreyas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
    
    var flipCount = 0 { didSet { scoreLabel.text = "Flips: \(flipCount)" } }
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var currentScore: UILabel!
    
    @IBAction func newGameButton(_ sender: UIButton) {
        startNewGame()
    }
    
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("Card was not in card buttons")
        }
    }
    
    func startNewGame() {
        flipCount = 0
        game.score = 0
        emojiChoics = randomEmojis
        emoji = [Int:String]()
        game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
        updateViewFromModel()
    }
    
    func updateViewFromModel() {
        currentScore.text = "Score: \(game.score)"
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
            }
            
        }
        
    }
    
    let randomEmojis = ["🎃", "👻", "😈", "👹", "🤪", "☠️", "💀", "🤡", "🍭"]
    
    lazy var emojiChoics = randomEmojis
    
    var emoji = [Int:String]()
    
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil {
            if emojiChoics.count > 0 {
                let randomIndex = Int(arc4random_uniform(UInt32(emojiChoics.count)))
                emoji[card.identifier] = emojiChoics.remove(at: randomIndex)
            }
        }
        
        return emoji[card.identifier] ?? "?"
    }

}

