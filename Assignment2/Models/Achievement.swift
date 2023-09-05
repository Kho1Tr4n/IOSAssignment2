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


import Foundation
import SwiftUI

var achievements = [
    "2500highScore": Achievement(id: UUID(), name: "Earn 2500 high score", color: "Bronze", imageName: "dollarsign.circle"),
    "3500highScore": Achievement(id: UUID(), name: "Earn 3500 high score", color: "Silver", imageName: "dollarsign.circle"),
    "5000highScore": Achievement(id: UUID(), name: "Earn 5000 high score", color: "Yellow", imageName: "dollarsign.circle"),
    "5games" : Achievement(id: UUID(), name: "Play 5 games", color: "Bronze", imageName: "5.circle"),
    "10games" : Achievement(id: UUID(), name: "Play 10 games", color: "Silver", imageName: "10.circle"),
    "20games" : Achievement(id: UUID(), name: "Play 20 games", color: "Yellow", imageName: "20.circle"),
   
]

struct Achievement : Identifiable , Codable {
    var id: UUID
    var name: String
    var color: String
    
    var imageName: String
    
    var image:Image {
        Image(systemName: imageName)
//            .foregroundColor(Color(.systemYellow)) as! Image
    }
    
}
