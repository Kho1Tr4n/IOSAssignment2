/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 2
  Author: Tran Minh Khoi
  ID: s3916827
  Created  date: 01/09/2023
  Last modified: 05/09/2023
  Acknowledgement: None
*/


import SwiftUI

struct MoneyIcon: View {
    var body: some View {
        Image("money")
            .resizable()
            .scaledToFit()
            
    }
}

struct MoneyIcon_Previews: PreviewProvider {
    static var previews: some View {
        MoneyIcon()
    }
}
