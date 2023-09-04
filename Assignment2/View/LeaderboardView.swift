//
//  LeaderboardView.swift
//  Assignment2
//
//  Created by Khoi Tran Minh on 30/08/2023.
//

import SwiftUI

struct LeaderboardView: View {
    @AppStorage("isDarkMode") private var isDarkMode = false
    var playerList : [Player]
    var userName : String
    
    var body: some View {
        VStack {
            ForEach(playerList.indices, id:\.self) {
                place in
                NavigationLink{
                    LeaderboardDetail(player: playerList[place])
                } label:
                {
                    LeaderboardRow(rank: place + 1,player: playerList[place] )

                }
            }
        }
    }
}

struct LeaderboardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderboardView(playerList: loadAllplayer() ?? [Player](), userName: "Kaiser")
    }
}
