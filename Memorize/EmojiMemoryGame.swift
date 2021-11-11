//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Bartosz Kut on 10/10/2021.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    
    private static let emojis: [String] = ["✈️", "🚄", "🚘", "🚌", "🚎","🚜", "🚛", "🛻", "🛵", "🚲", "🚔", "🛺", "🚍", "🚡", "🚠", "🚟", "🚂", "🚀", "🛸", "🛳", "⛵️", "🚁", "🛴", "🦽"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 6) { pairIndex in
            emojis[pairIndex]
        }
    }
        
    @Published private var model = createMemoryGame()
       
    var cards: Array<Card> {
        return model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(_ card: Card) {
        model.choose(card)
    }
}
