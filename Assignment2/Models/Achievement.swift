//
//  Achievement.swift
//  Assignment2
//
//  Created by Tran Trung on 01/09/2023.
//

import Foundation
import SwiftUI

var achievements = [
    "2000 coins": Achievement(id: UUID(), name: "Earn 2000 coins", imageName: "money"),
    "3500 coins": Achievement(id: UUID(), name: "Earn 3500 coins", imageName: "money"),
    "5000 coins": Achievement(id: UUID(), name: "Earn 5000 coins", imageName: "money"),
    "7500 coins": Achievement(id: UUID(), name: "Earn 7500 coins", imageName: "money"),
    "10000 coins": Achievement(id: UUID(), name: "Earn 10000 coins", imageName: "money"),
   
]

struct Achievement : Identifiable , Codable {
    var id: UUID
    var name: String
    
    var imageName: String
    
    var image:Image {
        Image(imageName)
    }
    
}
