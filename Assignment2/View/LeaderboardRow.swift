//
//  AchievementDisplay.swift
//  Assignment2
//
//  Created by Tran Trung on 01/09/2023.
//

import SwiftUI

struct LeaderboardRow: View {
    var rank: Int
    var player: Player
    
    var body: some View {
        HStack{
            Text(String(rank))
                .foregroundColor(.black)
                .frame(width: 30, height: 30)
                .background(Color("Yellow"))
                .font(.system(size: 20))
                .bold()
                .clipShape(Circle())
            
            Text(player.playerName)
                .foregroundColor(.black)
                .font(.system(size: 25))
                .fontWeight(.bold)
                .frame(maxWidth:150)
                .lineLimit(1)
                .offset(x:-20)
            
            Spacer()
            
            HStack{
            Image("money")
                .resizable()
                .scaledToFit()
                .frame(width: 40)
                .zIndex(1)
                
                Text(String(player.highScore))
                .foregroundColor(.black)
                .background(Color(.yellow))
                .font(.system(size:20))
                .fontWeight(.bold)
                .cornerRadius(30)
                .lineLimit(1)
            }
            .background(Color("Yellow"))
            .clipShape(RoundedRectangle(cornerRadius: 30))
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 16)
        .background(Color("Red"))
        .clipShape(RoundedRectangle(cornerRadius: 30))
    }
}

struct AchievementDisplay_Previews: PreviewProvider {
    static var previews: some View {
        LeaderboardRow(rank: 1, player:Player(id: UUID(), playerName: "Kaiser", highScore: 1000, coins: 100, achievement: [], history: []))
            
    }
}
