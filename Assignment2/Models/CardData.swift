//
//  ModelData.swift
//  Assignment2
//
//  Created by Tran Trung on 01/09/2023.
//

import Foundation


var cards = decodeJsonFromJsonFile(jsonFileName: "cards.json")


func decodeJsonFromJsonFile(jsonFileName: String) -> [Card] {
    if let file = Bundle.main.url(forResource: jsonFileName, withExtension: nil){
        if let data = try? Data(contentsOf: file) {
            do {
                let decoder = JSONDecoder()
                let decoded = try decoder.decode([Card].self, from: data)
                return decoded
            } catch let error {
                fatalError("Failed to decode JSON: \(error)")
            }
        }
    } else {
        fatalError("Couldn't load \(jsonFileName) file")
    }
    return [ ] as [Card]
}
