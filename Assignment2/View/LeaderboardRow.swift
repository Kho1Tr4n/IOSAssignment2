//
//  AchievementDisplay.swift
//  Assignment2
//
//  Created by Tran Trung on 01/09/2023.
//

import SwiftUI

struct LeaderboardRow: View {
    var rank: Int
    var playerName: String
    var score:Int
    
    var body: some View {
        HStack{
            Text(String(rank))
                .foregroundColor(.black)
                .frame(width: 30, height: 30)
                .background(.yellow)
                .font(.system(size: 20))
                .bold()
                .clipShape(Circle())
            
            Text(playerName)
                .foregroundColor(.black)
                .font(.system(size: 25))
                .fontWeight(.bold)
                .frame(maxWidth:100)
                .lineLimit(1)
            
            Spacer()
            
            HStack{
            Image("money")
                .resizable()
                .scaledToFit()
                .frame(width: 40)
                .zIndex(1)
            Text(String(score))
                .foregroundColor(.black)
                .background(Color(.yellow))
                .font(.system(size:20))
                .fontWeight(.bold)
                .lineLimit(1)
            }
            .background(Color(.yellow))
            .clipShape(RoundedRectangle(cornerRadius: 30))
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 16)
        .background(Color(.red))
        .clipShape(RoundedRectangle(cornerRadius: 30))
    }
}

struct AchievementDisplay_Previews: PreviewProvider {
    static var previews: some View {
            LeaderboardRow(rank: 1, playerName: "Kaiser", score: 1000)
            
    }
}
