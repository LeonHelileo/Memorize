//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Leonid Gneiting on 08/07/2022.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    
    private static let emojis = [ "🚂", "🚀", "🚁", "🚜", "🚗", "🚕",
                          "🚙", "🚌", "🚎", "🏎", "✈️", "🚑",
                          "🚒", "🚐", "🛻", "🚚", "🚛", "🛵",
                          "🛰", "🛸", "⛵️", "🚤", "🚃", "🚢"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<Card> {
        model.cards
    }
    
    // MARK : - Intent(s)
    func choose(_ card: Card) {
        //objectWillChange.send() // Dispatch the changes. (Don't need if @Published declared)
        model.choose(card)
    }
}
