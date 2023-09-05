/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 2
  Author: Tran Minh Khoi
  ID: s3916827
  Created  date: 30/08/2023
  Last modified: 05/09/2023
  Acknowledgement: None
*/

import SwiftUI

//MARK: LEADERBOARD DESIGN
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
