//
//  Button.swift
//  CardsGame
//
//  Created by Khoi Tran Minh on 30/08/2023.
//

import SwiftUI

struct buttonMenu: View {
    @AppStorage("isDarkMode") private var isDarkMode = false
    var disable : Bool
    let title: String
    
    var body: some View {
        
        
        ZStack{
            if(!isDarkMode){
                RoundedRectangle(cornerRadius: 40)
                    .fill(.black)
                
                Text(title)
                    .fontWeight(.bold)
                    .font(.system(size:30))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
            }
            else {
                RoundedRectangle(cornerRadius: 40)
                    .fill(.white)
                
                Text(title)
                    .fontWeight(.bold)
                    .font(.system(size:30))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
            }
            
        }
        .frame(width:350, height:100)
        
        
    }
}

struct Button_Previews: PreviewProvider {
    static var previews: some View {
        buttonMenu(disable: true, title: "NEW GAME" )
    }
}
