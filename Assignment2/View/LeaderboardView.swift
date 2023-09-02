//
//  LeaderboardView.swift
//  Assignment2
//
//  Created by Khoi Tran Minh on 30/08/2023.
//

import SwiftUI

struct LeaderboardView: View {
    var playerList : [Player]
    var userName : String
    
    var body: some View {
        ForEach(playerList.indices, id:\.self) {
            place in
            NavigationLink{
                LeaderboardDetail(player: playerList[place])
            } label:
            {
                    LeaderboardRow(rank: place + 1, playerName: playerList[place].playerName , score: playerList[place].highScore)
                
            }
        }
    }
}

struct LeaderboardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderboardView(playerList: loadAllplayer() ?? [], userName: "Kaiser")
    }
}
