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

func encodePlayers(playerDict : [String :Player]) -> Data{
    do {
       let data = try JSONEncoder().encode(playerDict)
       return data
    } catch let err {
        fatalError("Failed to encode JSON: \(err)")
    }
}


func decodePlayers(data : Data) -> [String : Player]?{
    let decoder = JSONDecoder()
    
    do {
        let playerDict = try decoder.decode([String : Player].self, from: data)
        return playerDict
    } catch {
        print(error.localizedDescription)
    }
    return nil
}


func saveplayer(playerName : String, saveplayer : Player){
    let playerName = playerName.uppercased()
    let data = UserDefaults.standard.data(forKey: "players")
    var playersDict = [String: Player]()
    if(data != nil){
        playersDict = decodePlayers(data: data!) ?? [String: Player]()
    }
    playersDict[playerName] = saveplayer
    let dataToSave = encodePlayers(playerDict: playersDict)
    UserDefaults.standard.set(dataToSave, forKey: "players")
}


func loadPlayer(playerName : String) -> Player? {
    let playerName = playerName.uppercased()
    let data = UserDefaults.standard.data(forKey: "players")
    if(data == nil){
        return nil
    }
    
    let playerDict = decodePlayers(data: data!)
    let player = playerDict?[playerName]
    return player
}


func loadAllplayer() -> [Player]? {
    let data = UserDefaults.standard.data(forKey: "players")
    if(data == nil){
        return []
    }
    
    let playerDict = decodePlayers(data: data!)
    var playerList:[Player] = Array(playerDict!.values)
    playerList.sort {
        $0.highScore > $1.highScore
    }
    return playerList
}
