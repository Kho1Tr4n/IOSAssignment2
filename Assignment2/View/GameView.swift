//
//  GameView.swift
//  Assignment2
//
//  Created by Khoi Tran Minh on 30/08/2023.
//

import SwiftUI

struct GameView: View {
    @State var highScore = UserDefaults.standard.integer(forKey: "highScore")
    @State var coins : Int = 1000
    @State var betAmount = 10
    @State var houseDeck = [0,1,2]
    @State var houseScore : Int = 0
    @State var playerDeck = [0,1,2]
    @State var playerScore : Int = 5
    @State var isChooseBet50 = true
    @State var isChooseBet100 = false
    @State var animating = false
    @State var showGameOver = false
    @State var isCardFlip = false
    @State var rotation : Double = 0
    
    
    
    func randomCards() {
        playerDeck = playerDeck.map({ _ in
            Int.random(in: 0...cards.count - 1)
        })
        
        houseDeck = houseDeck.map({_ in
            Int.random(in: 0...cards.count - 1)
        })
        print(houseDeck)
        print(playerDeck)
    }
    
    func checkWinning(){
        houseScore = (cards[houseDeck[0]].cardValue + cards[houseDeck[1]].cardValue + cards[houseDeck[2]].cardValue) % 10
        print(houseScore)
        
        playerScore = (cards[playerDeck[0]].cardValue + cards[playerDeck[1]].cardValue + cards[playerDeck[2]].cardValue) % 10
        print(playerScore)
        
        if (playerScore > houseScore) {
            
            playerWins()
            
            if(coins > highScore){
                newHighScore()
            }
        }
        
        else if (playerScore < houseScore) {
            playerLose()
            
        }
        
        
//        else if (playerScore == houseScore){
//            playerDraw()
//        }

    }
    
    func playerWins(){
        coins += (betAmount * 4)
        playSound(sound: "winning", type: "wav")
    }
    
//    func playerDraw(){
//        self.coins == coins
//    }
    
    func playerLose(){
        coins -= (betAmount * 2)
    }
    
    func newHighScore(){
        highScore = coins
        UserDefaults.standard.set(highScore, forKey: "highScore")
        playSound(sound: "highscore", type: "mp3")
    }
    
    func chooseBet50() {
        betAmount = 50
        isChooseBet50 = true
        isChooseBet100 = false
        playSound(sound: "bet-chip", type: "mp3")
        
    }
    
    func chooseBet100() {
        betAmount = 100
        isChooseBet50 = false
        isChooseBet100 = true
        playSound(sound: "bet-chip", type: "mp3")
    }
    
    
    func gameOver(){
        if coins <= 0 {
            showGameOver = true
            playSound(sound: "gameover", type: "mp3")
        }
    }
    
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
                    Text("NPC DECK")
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .font(.system(size: 30))
                    HStack{
                        ZStack{
                            if isCardFlip {
                                Image(cards[houseDeck[0]].imageName)
                                    .resizable()
                                    .modifier(CardImageModifier())
                                
                            } else {
                                Image("CardBack")
                                    .resizable()
                                    .modifier(CardImageModifier())
                                    .rotation3DEffect(.degrees(0.0), axis: (x:0, y:1, z:0))
                                
                            }
                        }.rotation3DEffect(.degrees(rotation), axis: (x: 0, y: 1, z: 0))
                            .onAppear {
                                Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { _ in
                                    if self.animating {
                                        withAnimation(Animation.linear(duration: 5)) {
                                            self.rotation += 180
                                        }
                                        if(self.rotation == 90){
                                            self.isCardFlip.toggle()
                                        }
                                        if(self.rotation == 180){
                                            self.animating = false
                                            self.rotation = 0
                                        }

                                    }
                                }
                            }
                        
                        ZStack{
                            if isCardFlip {
                                Image(cards[houseDeck[1]].imageName)
                                    .resizable()
                                    .modifier(CardImageModifier())
                                
                            } else {
                                Image("CardBack")
                                    .resizable()
                                    .modifier(CardImageModifier())
                                    .rotation3DEffect(.degrees(0.0), axis: (x:0, y:1, z:0))
                                
                            }
                        }.rotation3DEffect(.degrees(rotation), axis: (x: 0, y: 1, z: 0))
                            .onAppear {
                                Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { _ in
                                    if self.animating {
                                        print(self.rotation)
                                        withAnimation(Animation.linear(duration: 0.5)) {
                                            self.rotation += 180
                                        }
                                        if(self.rotation == 90){
                                            self.isCardFlip.toggle()
                                        }
                                        if(self.rotation == 180){
                                            self.animating = false
                                            self.rotation = 0
                                        }

                                    }
                                }
                            }
                        
                        ZStack{
                            if isCardFlip {
                                Image(cards[houseDeck[2]].imageName)
                                    .resizable()
                                    .modifier(CardImageModifier())
                                
                            } else {
                                Image("CardBack")
                                    .resizable()
                                    .modifier(CardImageModifier())
                                    .rotation3DEffect(.degrees(0.0), axis: (x:0, y:1, z:0))
                                
                            }
                        }.rotation3DEffect(.degrees(rotation), axis: (x: 0, y: 1, z: 0))
                            .onAppear {
                                Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { _ in
                                    if self.animating {
                                        print(self.rotation)
                                        withAnimation(Animation.linear(duration: 0.5)) {
                                            self.rotation += 180
                                            self.isCardFlip.toggle()
                                        }
                                        if(self.rotation == 90){
                                            self.isCardFlip.toggle()
                                        }
                                        if(self.rotation == 180){
                                            self.animating = false
                                            self.rotation = 0
                                        }

                                    }
                                }
                            }
                        
                    }
                }
                
                Spacer()
                
                VStack{
                    
                    HStack{
                        ZStack{
                            if isCardFlip {
                            Image(cards[playerDeck[0]].imageName)
                                .resizable()
                                .modifier(CardImageModifier())
                                
                            } else {
                                Image("CardBack")
                                    .resizable()
                                    .modifier(CardImageModifier())
                                    .rotation3DEffect(.degrees(180), axis: (x:0, y:1, z:0))
                                    
                            }
                            
                        }
                        .rotation3DEffect(.degrees(rotation), axis: (x: 0, y: 1, z: 0))
                            .onAppear {
                                Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { _ in
                                    if self.animating {
                                        print(self.rotation)
                                        withAnimation(Animation.linear(duration: 0.5)) {
                                            self.rotation += 180
                                            self.isCardFlip.toggle()
                                        }
                                        if(self.rotation == 90){
                                            self.isCardFlip.toggle()
                                        }
                                        if(self.rotation == 180){
                                            self.animating = false
                                            self.rotation = 0
                                        }

                                    }
                                }
                            }
                        ZStack{
                            if isCardFlip {
                                Image(cards[playerDeck[1]].imageName)
                                    .resizable()
                                    .modifier(CardImageModifier())
                                
                            } else {
                                Image("CardBack")
                                    .resizable()
                                    .modifier(CardImageModifier())
                                    .rotation3DEffect(.degrees(0.0), axis: (x:0, y:1, z:0))
                                
                            }
                        }.rotation3DEffect(.degrees(rotation), axis: (x: 0, y: 1, z: 0))
                            .onAppear {
                                Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { _ in
                                    if self.animating {
                                        print(self.rotation)
                                        withAnimation(Animation.linear(duration: 0.5)) {
                                            self.rotation += 180
                                            self.isCardFlip.toggle()
                                        }
                                        if(self.rotation == 90){
                                            self.isCardFlip.toggle()
                                        }
                                        if(self.rotation == 180){
                                            self.animating = false
                                            self.rotation = 0
                                        }

                                    }
                                }
                            }
                           
                        ZStack{
                            if isCardFlip {
                                Image(cards[playerDeck[2]].imageName)
                                    .resizable()
                                    .modifier(CardImageModifier())
                                
                            } else {
                                Image("CardBack")
                                    .resizable()
                                    .modifier(CardImageModifier())
                                    .rotation3DEffect(.degrees(0.0), axis: (x:0, y:1, z:0))
                                
                            }
                        }.rotation3DEffect(.degrees(rotation), axis: (x: 0, y: 1, z: 0))
                            .onAppear {
                                Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { _ in
                                    if self.animating {
                                        print(self.rotation)
                                        withAnimation(Animation.linear(duration: 0.5)) {
                                            self.rotation += 180
                                            self.isCardFlip.toggle()
                                        }
                                        if(self.rotation == 90){
                                            self.isCardFlip.toggle()
                                        }
                                        if(self.rotation == 180){
                                            self.animating = false
                                            self.rotation = 0
                                        }

                                    }
                                }
                            }
                        
                        
                    }
                    Text("PLAYER DECK")
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .font(.system(size:30))
                    
                    HStack {
                       
                        Button {
                            withAnimation(Animation.linear(duration: 5)) {
                                self.animating.toggle()
                            }
                            if (!isCardFlip) {
                                self.randomCards()
                                
                                
                                self.checkWinning()
                                
                                self.gameOver()
                            }
                            
                        } label: {
                            
                            
                            Text(!isCardFlip ? "PLAY" : "FOLD")
                                .bold()
                                .foregroundColor(.black)
                                .font(.system(size:30))
                                .multilineTextAlignment(.center)
                                .frame(width: 150, height: 75)
                                .background(.red)
                                .cornerRadius(40)
                            
                        }
                        
                        
                    }
                    
                    
                }
                
                Spacer()
                
                HStack{
                                    
                    HStack{
                        
                        // MARK: - BET 50 BUTTON
                        Button {
                            self.chooseBet50()
                        } label: {
                            HStack(spacing: 30){
                                Text("50")
                                    .foregroundColor(isChooseBet50 ? Color.black : Color.white)
                                    .modifier(BetCapsuleModifier())
                               Image("casino-chips")
                                    .resizable()
                                    .offset(x: isChooseBet50 ? 0 : 20)
                                    .opacity(isChooseBet50 ? 1 : 0 )
                                    .animation(.default, value: isChooseBet50)
                                    .modifier(CasinoChipModifier())
                            }
                            .padding(.horizontal, 30)
                        }
                        
                        Spacer()
                        
                        // MARK: - BET 100 BUTTON
                        Button {
                            self.chooseBet100()
                        } label: {
                            HStack(spacing: 30){
                                Image("casino-chips")
                                     .resizable()
                                     .offset(x: isChooseBet100 ? 0 : -20)
                                     .opacity(isChooseBet100 ? 1 : 0 )
                                     .modifier(CasinoChipModifier())
                                     .animation(.default, value: isChooseBet100)
                                Text("100")
                                    .foregroundColor(isChooseBet100 ? Color.black : Color.white)
                                    .modifier(BetCapsuleModifier())
                               
                            }
                            .padding(.horizontal, 20)
                        }
                    }
                    
                }

            } 
            if showGameOver{
                ZStack{
                    VStack{
                        Text("GAME OVER")
                            .font(.system(.title, design: .rounded))
                            .fontWeight(.heavy)
                            .foregroundColor(Color.white)
                            .padding()
                            .frame(minWidth: 280, idealWidth: 280, maxWidth: 320)

                        Spacer()

                        VStack {
                            Image("Logo")
                                .resizable()
                                .scaledToFit()
                                .frame(maxHeight: 150)
                            Text("You lost all your coins!\n Better luck next time!")
                                .font(.system(.body, design: .rounded))
                                .foregroundColor(Color.white)
                                .multilineTextAlignment(.center)
                            Button {
                                self.showGameOver = false
                                self.coins = 1000
                            } label: {
                                Text("Play Again?".uppercased())
                                    .foregroundColor(.black)
                            }
                            .padding(.vertical,10)
                            .padding(.horizontal, 20)
                            .background(
                                Capsule()
                                    .strokeBorder(lineWidth: 2)
                                    .foregroundColor(Color(.white))
                                    .background(.white)
                                    .cornerRadius(30)
                            )

                        }
                        Spacer()
                    }
                    .frame(minWidth: 280, idealWidth: 280, maxWidth: 320, minHeight: 300, idealHeight: 320, maxHeight: 350, alignment: .center)
                    .background(LinearGradient(colors:[Color(.red), Color(.black)], startPoint: .topLeading, endPoint: .bottomTrailing ))
                    .cornerRadius(20)
                }
            }
        }
    }
}



struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
