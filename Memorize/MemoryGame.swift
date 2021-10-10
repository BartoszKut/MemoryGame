//
//  MemoryGame.swift
//  Memorize
//
//  Created by Bartosz Kut on 10/10/2021.
//

import Foundation

struct MemoryGame<CardContent> {
    // (set) means, that other classes and structures can look at the model, but they can't change it
    private(set) var cards: [Card]
    
    func choose(_ card: Card) {
        
    }
    
    // second arg is a function, which takes int and returns CardContent
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        
        // add numberOfPairsOfCards X 2 cards to cards array
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    
    struct Card {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
    }
}
