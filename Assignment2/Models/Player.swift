//
//  User.swift
//  CardsGame
//
//  Created by Khoi Tran Minh on 30/08/2023.
//

import Foundation

struct Player : Codable {
    var id: UUID
    var playerName : String
    var highScore: Int
    var coins : Int
    var achievement : [String]
    var history : [Game]
}
