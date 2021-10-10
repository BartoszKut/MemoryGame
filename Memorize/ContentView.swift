//
//  ContentView.swift
//  Memorize
//
//  Created by Bartosz Kut on 05/10/2021.
//

import SwiftUI

struct ContentView: View {
    var emojis: [String] = ["✈️", "🚄", "🚘", "🚌", "🚎","🚜", "🚛", "🛻", "🛵", "🚲", "🚔", "🛺", "🚍", "🚡", "🚠", "🚟", "🚂", "🚀", "🛸", "🛳", "⛵️", "🚁", "🛴", "🦽"]
    @State var emojiCount: Int = 4
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(cardContent: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
                .foregroundColor(.red)
            }
            Spacer()
            HStack {
                removeCardButton
                Spacer()
                shuffleButton
                Spacer()
                addCardButton
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding(.horizontal)
    }
    
    var removeCardButton: some View {
        Button(action: {
            if emojiCount > 2 {
                emojiCount -= 1
            }
        }, label: {
            Image(systemName: "minus.circle")
        })
    }
    
    var addCardButton: some View {
        Button(action: {
            if emojiCount < emojis.count {
                emojiCount += 1
            }
        }, label: {
            Image(systemName: "plus.circle")
        })
    }
    
    var shuffleButton: some View {
        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
            Text("Shuffle")
        })
        .foregroundColor(.blue)
    }
}

struct CardView: View {
    var cardContent: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let cardShape = RoundedRectangle(cornerRadius: 20.0)
            if isFaceUp {
                cardShape.fill().foregroundColor(.white)
                cardShape.strokeBorder(lineWidth: 3)
                Text(cardContent).font(.largeTitle)
            } else {
                cardShape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}
 








struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.light)
    }
}
