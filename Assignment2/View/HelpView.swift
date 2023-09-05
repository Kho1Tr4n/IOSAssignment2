/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 2
  Author: Tran Minh Khoi
  ID: s3916827
  Created  date: 25/08/2023
  Last modified: 05/09/2023
  Acknowledgement: None
*/

import SwiftUI

struct HelpView: View {
  
  var body: some View {
      ScrollView{
          
          VStack(alignment: .center, spacing: 10) {
              LogoView(logoFileName: "Logo")
              
              Spacer()
              
              //MARK: RULES DESIGN
              VStack {
                  Text("RULES")
                      .fontWeight(.heavy)
                      .font(.system(size: 20))
                  Spacer()
                  
                  VStack(alignment: .leading) {
                      Text("1. Player will have 3 cards and House will have three cards \n")
                      Text("2. Ace will be one and those other cards such as 2, 3, 4, 5, 6 , 7, 8, 9 is count as the  same value on that cards")
                          VStack {
                              Spacer()
                              HStack {
                                  Image("AceHeart")
                                      .resizable()
                                  .modifier(CardImageModifier())
                                  Image("TwoHeart")
                                      .resizable()
                                      .modifier(CardImageModifier())
                                  Image("ThreeHeart")
                                      .resizable()
                                      .modifier(CardImageModifier())
                              }
                              
                              HStack {
                                  Image("FourHeart")
                                      .resizable()
                                  .modifier(CardImageModifier())
                                  Image("FiveHeart")
                                      .resizable()
                                      .modifier(CardImageModifier())
                                  Image("SixHeart")
                                      .resizable()
                                      .modifier(CardImageModifier())
                              }
                              
                              HStack {
                                  Spacer()
                                  Image("SevenHeart")
                                      .resizable()
                                  .modifier(CardImageModifier())
                                  Image("EightHeart")
                                      .resizable()
                                      .modifier(CardImageModifier())
                                  
                                  Image("NineHeart")
                                      .resizable()
                                      .modifier(CardImageModifier())
                                  Spacer()
                              }
                              Image("TenHeart")
                                  .resizable()
                              .modifier(CardImageModifier())
                              
                          } .padding(.bottom,30)
                          .padding(.top, 20)
                      
                      Text("3. 10, Jack, Queen or King is count as 10 ")
                      HStack {
                          Spacer()
                          
                          Image("JackHeart")
                              .resizable()
                              .modifier(CardImageModifier())
                          
                          Image("QueenHeart")
                              .resizable()
                              .modifier(CardImageModifier())
                          Image("KingHeart")
                              .resizable()
                              .modifier(CardImageModifier())
                          Spacer()
                      } .padding(.horizontal, 28.0)
                      
                      Text("4. The total score of player's deck is the odd-number of the total three cards score \n")
                      
                      HStack {
                          Spacer()
                          Image("SevenHeart")
                              .resizable()
                              .modifier(CardImageModifier())
                          Image("EightDiamond")
                              .resizable()
                              .modifier(CardImageModifier())
                          Image("KingHeart")
                              .resizable()
                              .modifier(CardImageModifier())
                          Spacer()
                      }
                      Spacer()
                      VStack(alignment: .leading) {
                          Text("5. For example above, if your total three cards's score is 15 that means your score is 5\n")
                          Text("6. In order to win your score must be larger than house'score \n")
                      }
                      
                      
                  }.font(.system(size:12))
                      .padding(.leading,20)
                      .padding(.trailing,10)
                  
                  
                 
                 
                  
              }
              
              Spacer()
              //MARK: HOW TO PLAY DESIGN
              
              VStack {
                 
                  Text("HOW TO PLAY")
                      .fontWeight(.heavy)
                      .font(.system(size: 20))
                      
                  Spacer()
                  
                  VStack(alignment: .leading) {
                      Text("The cards will be fold when you are start the new game\n")
                      
                      HStack {
                          Spacer()
                          
                          Image("CardBack")
                              .resizable()
                              .modifier(CardImageModifier())
                          Image("CardBack")
                              .resizable()
                              .modifier(CardImageModifier())
                          Image("CardBack")
                              .resizable()
                              .modifier(CardImageModifier())
                          
                          Spacer()
                          
                      }
                      
                      VStack {
                          Text("Your coins available will be on top left and it will increase if you win and decrease if you loose \n")
                          
                          Image("PlayerCoins")
                              .resizable()
                              .frame(width: 185, height: 350)
                      }
                      
                      
                      
                      VStack {
                          Text("Your highest score will be on top right and it will change if your coins is larger than your previous highscore \n")
                          Image("HighScore")
                              .resizable()
                              .frame(width: 185, height: 350)
                          
                      }
                      
                      VStack {
                          Text("You can choose bet 50 or 100 at the bottom below \n")
                          Image("BetBtn")
                              .resizable()
                              .frame(width: 185, height: 350)
                              .padding(.leading, 75)
                      }
                      
                      Text("The cards will be randomize when you click play and the cards will be flipped and reveal\n")
                      
                      VStack {
                          Text("In order to continute to the new game you have to click the fold button then the play button will reveal for you to keep playing\n")
                          Image("FoldBtn")
                              .resizable()
                              .frame(width: 185, height: 350)
                      }
                      
                      Text("You can keep playing the game even after you change the game's diffculty, your coins will keep the same and the high score too.\n ")
                      
                      VStack{
                          Text("If you loose all of your coins the game will pop up an announce to let you know that the game is over and you can press 'Play Again' button to create a new game")
                          Image("GameOver")
                              .resizable()
                              .frame(width: 185, height: 350)
                      }
                  }
                  .padding(.horizontal, 10.0)
                  
                  Spacer()
                  
                  //MARK: POINTS RULES
                  VStack{
                      Text("Coins")
                          .fontWeight(.heavy)
                          .font(.system(size: 20))
                      
                      VStack(alignment: .leading){
                          Text("When you win a round your coins will increase and when you loose your coins will decrease depend on each level difficulty you choose \n")
                          VStack(alignment: .leading) {
                              Text("Easy: ")
                                  .bold()
                              Text(" - Winning : Your coins + the bet amount x 5\n")
                              Text(" - Losing : Your coins - the bet amount")
                          }
                          Spacer()
                          
                          VStack(alignment: .leading) {
                              Text("Meidum: ")
                                  .bold()
                              Text(" - Winning : Your coins + the bet amount x 5\n")
                              Text(" - Losing : Your coins - the bet amount x 3")
                          }
                          Spacer()
                          
                          VStack(alignment: .leading) {
                              Text("Hard: ")
                                  .bold()
                              Text(" - Winning : Your coins + the bet amount x 5\n")
                              Text(" - Losing : Your coins - the bet amount x 8")
                          }
                          
                          
                          
                      }.padding(.horizontal, 8.0)
                      
                  }
                      
              } .font(.system(size:12))
                  .padding(.leading,10)
                  .padding(.trailing,20)
              
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
