//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Bartosz Kut on 10/10/2021.
//

import SwiftUI

class EmojiMemoryGame {
    static let emojis: [String] = ["✈️", "🚄", "🚘", "🚌", "🚎","🚜", "🚛", "🛻", "🛵", "🚲", "🚔", "🛺", "🚍", "🚡", "🚠", "🚟", "🚂", "🚀", "🛸", "🛳", "⛵️", "🚁", "🛴", "🦽"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4, createCardContent: { pairIndex in
        EmojiMemoryGame.emojis[pairIndex]
        })
    }
        
    private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
       
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
}
