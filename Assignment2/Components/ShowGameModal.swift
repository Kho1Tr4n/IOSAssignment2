//
//  ShowGameModal.swift
//  Assignment2
//
//  Created by Khoi Tran Minh on 30/08/2023.
//

import SwiftUI

struct ShowGameModal: View {
    var coins : Int
    
    var showGameOverModal : Bool = false
    
    var body: some View {
        ZStack{
            Color("ColorBlackTransparent")
                .edgesIgnoringSafeArea(.all)
            VStack{
                Text("GAME OVER")
                    .font(.system(.title, design: .rounded))
                    .fontWeight(.heavy)
                    .foregroundColor(Color.white)
                    .padding()
                    .frame(minWidth: 280, idealWidth: 280, maxWidth: 320)
                    .background(Color("ColorRedRMIT"))
                
                Spacer()
                
                VStack {
                    Image("rmit-casino-logo")
                        .resizable()
                        .scaledToFit()
                        .frame(maxHeight: 150)
                    Text("You lost all money!\nYou are not the god of gambler!\n Good luck next time!")
                        .font(.system(.body, design: .rounded))
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                    Button {
                        self.showGameOverModal = false
                        self.coins = 100
                    } label: {
                        Text("New Game".uppercased())
                    }
                    .padding(.vertical,10)
                    .padding(.horizontal, 20)
                    .background(
                        Capsule()
                            .strokeBorder(lineWidth: 2)
                            .foregroundColor(Color("ColorRedRMIT"))
                    )

                }
                Spacer()
            }
            .frame(minWidth: 280, idealWidth: 280, maxWidth: 320, minHeight: 280, idealHeight: 300, maxHeight: 350, alignment: .center)
            .background(Color("ColorBlueRMIT"))
            .cornerRadius(20)
        }.onAppear(perform: {
            playSound(sound: "drum-music", type: "mp3")
          })
    }//ZStack
    }
}

struct ShowGameModal_Previews: PreviewProvider {
    static var previews: some View {
        ShowGameModal()
    }
}
