//
//  Card.swift
//  Assignment2
//
//  Created by Khoi Tran Minh on 30/08/2023.
//

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
