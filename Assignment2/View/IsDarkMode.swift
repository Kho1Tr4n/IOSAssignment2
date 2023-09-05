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

//MARK: DESIGN DARK MODE
struct IsDarkMode: View {
    @AppStorage("isDarkMode") private var isDarkMode = false
    var body: some View {
        Toggle("Dark Mode", isOn: $isDarkMode).padding([.leading, .trailing], 50)
            
        
        
        
    }
}

struct isDarkMode_Previews: PreviewProvider {
    static var previews: some View {
        IsDarkMode()
    }
}
