//
//  SettingView.swift
//  Assignment2
//
//  Created by Khoi Tran Minh on 30/08/2023.
//

import SwiftUI

var mode = ["Easy", "Medium", "Hard"]

struct SettingView: View {
    @AppStorage("isDarkMode") private var isDarkMode = false
    @Binding var gameMode : String
    var body: some View {
        VStack{
            Spacer()
            
            IsDarkMode()
                .bold()
           
            Text("GAME DIFFICULTY:")
                .bold()
                .font(.system(size: 20))
                .frame(width: 180, alignment: .leading)
            
            
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
            
                
        } .frame(width:300,alignment: .leading)
           
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
            
            Spacer()
            
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView(gameMode: .constant("Easy"))
    }
}
