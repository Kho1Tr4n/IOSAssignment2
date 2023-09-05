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

var mode = ["Easy", "Medium", "Hard"]

//MARK: SETTING DESIGN
struct SettingView: View {
    @AppStorage("isDarkMode") private var isDarkMode = false
    @Binding var gameMode : String
    var body: some View {
        ZStack{
            VStack{
                Spacer()
                
                //MARK: DARK MODE TOGGLE
                IsDarkMode()
                    .bold()
                
                Text("GAME DIFFICULTY:")
                    .bold()
                    .font(.system(size: 20))
                    .frame(width: 180, alignment: .leading)
                
                //MARK: DISPLAY MODE
                Picker("MODE", selection: $gameMode) {
                    ForEach(mode, id:\.self) {
                        modes in
                        Text(modes)
                        
                    }
                }
                .foregroundColor(.black)
                .cornerRadius(40)
                .pickerStyle(.segmented)
                
                Spacer()
                //MARK: TEXT EXPLAIN EACH DIFFICULTY
                
                VStack {
                    if(gameMode == "Easy"){
                        Text("You will get x5 your bet amount when you win. You loose only the same amount of bet amount you choose")
                    }
                    if(gameMode == "Medium"){
                        Text("You will get x5 your bet amount when you win. You loose only x3 bet amount you choose")
                    }
                    if(gameMode == "Hard"){
                        Text("You will get x5 your bet amount when you win. You loose only x8 bet amount you choose")
                    }
                    
                    
                    
                }
                Spacer()
                
                
            } .frame(width:300,alignment: .leading)
            
            
            
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView(gameMode: .constant("Easy"))
    }
}
