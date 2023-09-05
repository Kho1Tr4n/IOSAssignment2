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


import Foundation
import SwiftUI


struct Card : Identifiable, Codable{
    var id: Int
    var cardName: String
    var cardValue: Int
    
    
    var imageName:String
//    var image:Image {
//        Image(imageName)
//    }
}
