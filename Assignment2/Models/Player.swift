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

struct Player : Codable {
    var id: UUID
    var playerName : String
    var highScore: Int
    var coins : Int
    var achievement : [String]
    var history : [Game]
}
