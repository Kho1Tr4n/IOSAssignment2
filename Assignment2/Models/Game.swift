//
//  Game.swift
//  Assignment2
//
//  Created by Tran Trung on 01/09/2023.
//

import Foundation

struct Game : Identifiable , Codable {
    var id: Int
    var mode : String
    var score : Int
}
