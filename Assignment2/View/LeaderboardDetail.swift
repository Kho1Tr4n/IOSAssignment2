//
//  LeaderboardDetail.swift
//  Assignment2
//
//  Created by Tran Trung on 01/09/2023.
//

import SwiftUI

struct LeaderboardDetail: View {
    var player:Player
    @State var playerAchievement = [Achievement]()
    
    init(player:Player) {
        self.player = player
        self._playerAchievement = State(initialValue: [Achievement]())
    }
    
    func checkAchievement(){
        if (player.highScore >= 2500)
        {
            playerAchievement.append(achievements["2500highScore"]!)
            
        }
        if (player.highScore >= 3500)
        {
            playerAchievement.append(achievements["3500highScore"]!)
            
        }
        if (player.highScore >= 5000)
        {
            playerAchievement.append(achievements["5000highScore"]!)
            
        }
        if (player.history.count >= 5) {
            playerAchievement.append(achievements["5games"]!)
        }
        if (player.history.count >= 10) {
            playerAchievement.append(achievements["10games"]!)
        }
        if (player.history.count >= 20) {
            playerAchievement.append(achievements["20games"]!)
        }
        
        print(playerAchievement)
    }
    
    var body: some View {
        ScrollView {
            VStack{
                
                Divider()
                    .overlay(.black)
                
                HStack{
                
                VStack {
                    Text("Highest Score: ")
                    Text(String(player.highScore))
                        .bold()
                        
                    }
                
                    Divider()
                        .overlay(.black)
                    
                    VStack {
                        Text("Game Played:")
                        Text(String(player.history.count))
                            .bold()
                    }
                
                }
                
                
                
            }
            
            Divider()
                .overlay(.black)
                .padding(.horizontal, 20)
            
            
                
                VStack{
                    Text("Game history:")
                        .font(.system(size:20))
                        .bold()
                        .padding(.vertical, 10)
                    
                    if(player.history.count == 0){
                        Text("No Games has play")
                            
                    }
                    ForEach(player.history) {
                        game in
                        HStack{
                            Text("Mode: \(game.mode)")
                                .bold()
                            
                            Spacer()
                            
                            HStack{
                                MoneyIcon()
                                    .frame(width: 40)
                                Text(String(game.score))
                                    .bold()
                            }
                            
                        }.padding(.leading, 10)
                        .padding(.trailing, 10)
                        .background(Color("Red"))
                        .cornerRadius(30)
                        .padding(.leading, 10)
                        .padding(.trailing, 10)
                        
                        
                    }
                    Divider()
                        .overlay(.black)
                        .padding(.horizontal, 20)
                    
                    VStack{
                        Text("Achievement: ")
                            .font(.system(size:20))
                            .bold()
                        
                        if(!playerAchievement.isEmpty){
                        
                            ForEach(playerAchievement) { achievement in
                                HStack{
                                    achievement.image
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 50)
                                        .cornerRadius(20)
                                        .padding(.leading, 20)
                                        .padding(.trailing, 14)
                                        .fontWeight(.heavy)
                                        .foregroundColor(Color(achievement.color))

                                    Text(achievement.name)
                                        .bold()
                                        .font(.system(size:20))

                                    Spacer()
                                }
                                .frame(height:70)
                                .background(Color("Red"))
                                .cornerRadius(20)
                                .padding(.trailing,10)
                                .padding(.leading, 10)
                            }
                            
                            
                        } else {
                            Text("You haven't earn an achievement yet")
                        }
                    
                }
            }
        }
        
        .onAppear{
            checkAchievement()
        }
        .navigationTitle("\(player.playerName) Achievement")
    }
}

struct LeaderboardDetail_Previews: PreviewProvider {
    static var previews: some View {
        LeaderboardDetail(player:Player(id: UUID(), playerName: "Kaiser", highScore:10000, coins: 1000, achievement: [], history: [Game(id:UUID(),mode: "Easy", score: 100 )]
           ))
    }
}
