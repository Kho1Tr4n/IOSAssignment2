//
//  GameView.swift
//  Assignment2
//
//  Created by Khoi Tran Minh on 30/08/2023.
//

import SwiftUI

struct GameView: View {
    var mode: String
    
    @State var betAmount = 50
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
    @State var player: Player
    
    
    
    //MARK: RANDOM CARDS FUNCTION
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
    
    //MARK: CHECK WIN
    func checkWinning(){
        houseScore = (cards[houseDeck[0]].cardValue + cards[houseDeck[1]].cardValue + cards[houseDeck[2]].cardValue) % 10
        print(houseScore)
        
        playerScore = (cards[playerDeck[0]].cardValue + cards[playerDeck[1]].cardValue + cards[playerDeck[2]].cardValue) % 10
        print(playerScore)
        
        if (playerScore > houseScore) {
            
            playerWins()
            
            if(player.coins > player.highScore){
                newHighScore()
            }
        }
        
        else if (playerScore < houseScore) {
            playerLose()
            
        }

    }
    
    //MARK: WINNING OR LOSING FUNCTION
    func playerWins(){
        switch(mode){
            
        case "Easy":
            player.coins += (betAmount * 5)
            
        case "Medium":
            player.coins += (betAmount * 5)
            
        case "Hard":
            player.coins += (betAmount * 5)
            
        default:
            player.coins += (betAmount * 5)
        }
        
        playSound(sound: "winning", type: "wav")
    }
    

    
    func playerLose(){
        switch(mode){
            
        case "Easy":
            player.coins -= betAmount
            
        case "Medium":
            player.coins -= (betAmount * 3)
            
            
        case "Hard":
            player.coins -= (betAmount * 8)
            
        default:
            player.coins -= betAmount
        }
        
    }
    
    //MARK: SET NEW HIGHSCORE
    func newHighScore(){
        if (player.coins > player.highScore ){
            player.highScore = player.coins
            saveplayer(playerName: player.playerName, saveplayer: player)
            playSound(sound: "highscore", type: "mp3")
        }
    }
    
    //MARK: CHOOSE BET FUNCTION
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
    
    //MARK: GAME OVER
    func gameOver(){
        if player.coins <= 0 {
            player.history.append(Game(id: UUID(), mode: mode, score: player.highScore))
            player.coins = 1000
            saveplayer(playerName: player.playerName, saveplayer: player)
            showGameOver = true
            
            playSound(sound: "gameover", type: "mp3")
        }
    }
    
    //MARK: ACHIEVEMENT
    func checkAchievement(){
        
    }
    
    //MARK: GAME DESIGN
    var body: some View {
        ZStack{
            VStack {
                HStack {
                    HStack{
                        Text("Your\nMoney".uppercased())
                            .modifier(scoreLabelStyle())
                            .multilineTextAlignment(.trailing)
                        Text("\(player.coins)")
                            .modifier(scoreNumberStyle())
                    }
                    .modifier(scoreCapsuleStyle())
                    
                    Spacer()
                    
                    HStack{
                        Text("\(player.highScore)")
                            .modifier(scoreNumberStyle())
                            .multilineTextAlignment(.leading)
                        Text("High\nScore".uppercased())
                            .modifier(scoreLabelStyle())
                    }
                    .modifier(scoreCapsuleStyle())
                }
                Spacer()
                
                
                //MARK: HOUSE DECK DESIGN
                VStack{
                    Text("HOUSE DECK")
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
                //MARK: PLAYER DECK DESIGN
                
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
                    
                    //MARK: BUTTON TO PLAY
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
            
            //MARK: GAME OVER DESIGN
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
                                player.coins = 1000
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
        GameView(mode: "Easy", player:Player(id: UUID(), playerName: "Khoi", highScore: 0, coins: 1000, achievement: [], history: []))
    }
}
