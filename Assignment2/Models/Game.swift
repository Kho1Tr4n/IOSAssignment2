//
//  Game.swift
//  Assignment2
//
//  Created by Khoi Tran Minh on 30/08/2023.
//

import Foundation


struct Game: Codable, Hashable{
    var cards = ["AceHearts","TwoHearts","ThreeHearts","FourHearts","FiveHearts","SixHearts","SevenHearts","EightHearts","NineHearts","TenHearts","JackHearts","QueenHearts","KingHearts",
         "AceSpade","TwoSpade","ThreeSpade","FourSpade","FiveSpade","SixSpade","SevenSpade","EightSpade","NineSpade","TenSpade","JackSpade","QueenSpade","KingSpade",
         "AceClub","TwoClub","ThreeClub","FourClub","FiveClub","SixClub","SevenClub","EightClub","NineClub","TenClub","JackClub","QueenClub","KingClub",
         "AceDiamond","TwoDiamond","ThreeDiamond","FourDiamond","FiveDiamond","SixDiamond","SevenDiamond","EightDiamond","NineDiamond","TenDiamond","JackDiamond","QueenDiamond","KingDiamond",]
    
    
    var highScore = UserDefaults.standard.integer(forKey: "highScore")
    var coins : Int = 1000
    var betAmount = 10
    var houseDeck = [0,1,2]
    var houseScore : Int
    var playerDeck = [0,1,2]
    var playerScore : Int
    var isChooseBet50 = true
    var isChooseBet100 = false
    var showGameModal = false
    
    mutating func randomCards() {
        playerDeck = playerDeck.map({ _ in
            Int.random(in: 0...cards.count)
        })
        
        houseDeck = houseDeck.map({_ in
            Int.random(in: 0...cards.count)
        })
    }
    
    mutating func checkWinning(){
        if (playerScore > houseScore) {
            playerWins()
        }
        else if (playerScore == houseScore) {
            playerDraw()
        }
        else{
            playerLose()
        }
        
    }
    
    mutating func playerWins(){
        coins += betAmount * 10
    }
    
    mutating func playerDraw(){
        coins += betAmount
    }
    
    mutating func playerLose(){
        coins -= betAmount
    }
    
    mutating func newHighScore(){
        highScore = coins
        UserDefaults.standard.set(highScore, forKey: "highScore")
    }
    
    mutating func chooseBet50() {
        betAmount = 50
        isChooseBet50 = true
        isChooseBet100 = false
        
    }
    
    mutating func chooseBet100() {
        betAmount = 100
        isChooseBet50 = false
        isChooseBet100 = true
    }
    
    mutating func resetGame(){
        UserDefaults.standard.set(0, forKey: "highScore")
        highScore = 0
        coins = 1000
        chooseBet50()
        
    }
    
    mutating func gameOver(){
        if coins <= 0 {
            showGameModal = true
        }
    }
    
}
