//
//  InfoView.swift
//  RMIT Casino
//
//  Created by Tom Huynh on 8/2/22.
//

import SwiftUI

struct HelpView: View {
  
  var body: some View {
      ZStack{
          
          VStack(alignment: .center, spacing: 10) {
            LogoView(logoFileName: "Logo")
            
            Spacer()
            
            Form {
                Section(header:Text("RULES")){
                    Text("Player will have 3 cards and House will have three cards")
                    Text("Those cards such as 2, 3, 4, 5, 6 , 7, 8, 9 is count as the same value on that cards")
                    Text("10, Jack, Queen or King is count as 10")
                    Text("The total score of player's deck is the odd-number of the total three cards score")
                    Text("For example, if your total three cards's score is 15 that means your score is 5")
                    Text("In order to win your score must be larger than house'score")
                    
                }
                Section(header: Text("HOW TO PLAY")) {
                    Text("The cards will be fold when you are start the new game")
                    Text("Your coins available will be on top left and it will increase if you win and decrease if you loose")
                    Text("Your highest score will be on top right and it will change if your coins is larger than your previous highscore")
                    Text("You can choose bet 50 or 100 at the bottom below")
                    Text("The cards will be randomize when you click play and the cards will be flipped and reveal")
                    Text("In order to continute to the new game you have to click the fold button then the play button will reveal for you to keep playing")
                }
                
            }
            .font(.system(.body, design: .rounded))
          }
          .padding(.top, 40)
          
            
      }
    
  }
}


struct InfoView_Previews: PreviewProvider {
  static var previews: some View {
    HelpView()
  }
}
