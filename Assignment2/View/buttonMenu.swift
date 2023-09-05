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

//MARK: DESIGN BUTTON MENU
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
