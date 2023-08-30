//
//  GameView.swift
//  Assignment2
//
//  Created by Khoi Tran Minh on 30/08/2023.
//

import SwiftUI

struct GameView: View {
    @State private var coins = 1000
    @State private var highScore = 0
    @State private var playerDeck = [0,1,2]
    @State private var houseDeck = [0,1,2]
    let cards = ["AceHeart", ]
    var body: some View {
        ZStack{
            VStack {
                HStack {
                    HStack{
                        Text("Your\nMoney".uppercased())
                            .modifier(scoreLabelStyle())
                            .multilineTextAlignment(.trailing)
                        Text("\(coins)")
                            .modifier(scoreNumberStyle())
                    }
                    .modifier(scoreCapsuleStyle())
                    Spacer()
                    HStack{
                        Text("\(highScore)")
                            .modifier(scoreNumberStyle())
                            .multilineTextAlignment(.leading)
                        Text("High\nScore".uppercased())
                            .modifier(scoreLabelStyle())
                    }
                    .modifier(scoreCapsuleStyle())
                }
                Spacer()
                
                VStack{
                    ZStack{
                        CardView()
                        Image(cards[playerDeck[0]])
                            .resizable()
                            .modifier(CardImageModifier())
                    }
//                    ZStack{
//                        CardView()
//                        Image(cards[playerDeck[1]])
//                            .resizable()
//                            .modifier(CardImageModifier())
//                    }
//                    ZStack{
//                        CardView()
//                       Image(cards[playerDeck[2]])
//                            .resizable()
//                            .modifier(CardImageModifier())
//                    }
                    
                    
                }
                Spacer()
                
                
                
                
            }
            
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
