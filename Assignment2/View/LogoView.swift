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

//MARK: DESIGN LOGO
struct LogoView: View {
    var logoFileName: String
    var body: some View {
        Image("Logo")
                    .resizable()
                    .scaledToFit()
                    .frame(minHeight: 130, idealHeight: 170, maxHeight: 200, alignment: .center)
                    .modifier(ShadowModifier())
    }
}

struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        LogoView(logoFileName: "Logo")
    }
}
