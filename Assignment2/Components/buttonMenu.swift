//
//  Button.swift
//  CardsGame
//
//  Created by Khoi Tran Minh on 30/08/2023.
//

import SwiftUI

struct buttonMenu: View {
    
    var disable : Bool
    let title: String
    
    var body: some View {
        
        let opacity = disable ? 0.3 : 1
        ZStack{
            RoundedRectangle(cornerRadius: 40)
                .fill(.black)
            
            Text(title)
                .fontWeight(.bold)
                .font(.system(size:30))
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
        }
        .frame(width:400, height:100)
        .opacity(opacity)
        
    }
}

struct Button_Previews: PreviewProvider {
    static var previews: some View {
        buttonMenu(disable: true, title: "NEW GAME" )
    }
}
