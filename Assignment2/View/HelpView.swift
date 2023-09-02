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
              Section(header: Text("Introduce")) {
                  Text("Scratch card, also known as three cards, is a type of card game with a deck of playing cards. It can be said that this is one of the simplest and fastest ways to play folk cards and depends entirely on the element of luck. Scratch cards are played with two or more people, there is no limit to the number of people, but each person must have three cards.")
              }
                Section(header:Text("HOW TO PLAY")){
                    Text("Player will have 3 cards and House will have three cards")
                    Text("Those cards such as 2, 3, 4, 5, 6 , 7, 8, 9 is count as the same value on that cards")
                    Text("10, Jack, Queen or King is count as 10")
                    Text("The total score of player's deck is the odd-number of the total three cards score")
                    Text("For example, if your total three cards's score is 15 that means your score is 5")
                    Text("In order to win your score must be larger than house'score")
                    
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
