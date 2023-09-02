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
        var achievementList = [Achievement]()
        
        for (name) in player.achievement{
            achievementList.append(achievements[name]!)
        }
        
        self._playerAchievement = State(initialValue: achievementList)
    }
    
    var body: some View {
        ScrollView {
            VStack{
                Text("Info")
                    .font(.system(size:30))
                    .fontWeight(.bold)
                
                Divider()
                    .overlay(.gray)
                HStack{
                
                VStack {
                    Text("Your Coins: ")
                    Text(String(player.coins))
                        .bold()
                        
                    }
                
                    Divider()
                    
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
                        Text("No Players")
                            .foregroundColor(.black)
                    }
                    ForEach(player.history) {
                        game in
                        HStack{
                            Text("Mode: \(game.mode)")
                            
                            Spacer()
                            
                            HStack{
                                MoneyIcon()
                                    .frame(width: 40)
                                Text(String(game.score))
                                    .foregroundColor(.black)
                                    .bold()
                            }
                            
                        }.padding(.leading, 10)
                        .padding(.trailing, 10)
                        
                        
                    }
                    Divider()
                        .overlay(.black)
                        .padding(.horizontal, 20)
                    
                    VStack{
                        Text("Achievement: ")
                            .font(.system(size:20))
                            .bold()
                        
                        if(playerAchievement.isEmpty){
                            Text("You haven't earn an achievement yet")
                                .foregroundColor(.black)
                            
                            ForEach(playerAchievement) { achievement in
                                HStack{
                                    achievement.image
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 60)
                                        .cornerRadius(20)
                                        .padding(.leading, 20)
                                        .padding(.trailing, 14)
                                    
                                    Text(achievement.name)
                                        .bold()
                                        .font(.system(size:20))
                                    
                                    Spacer()
                                }
                                .frame(height:100)
                                .background(Color(.gray))
                                .cornerRadius(20)
                            }
                            
                            
                        }
                    
                }
            }
        }
        .navigationTitle("\(player.playerName) Achievement")
    }
}

struct LeaderboardDetail_Previews: PreviewProvider {
    static var previews: some View {
        LeaderboardDetail(player:Player(id: UUID(), playerName: "Kaiser", highScore:10000, coins: 1000, achievement: [], history: [Game(id:1,mode: "Easy", score: 100 )]
           ))
    }
}
