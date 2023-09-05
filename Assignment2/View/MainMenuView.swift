
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

struct MainMenuView: View {
    @AppStorage("isDarkMode") private var isDarkMode = false
    @State var playerNameInput: String = ""
    @State var player:Player
    @State var logIn : Bool
    @State var gameMode = "Easy"
    
    
    init(){
        self._player = State(initialValue: Player(id: UUID(), playerName: "", highScore: 0, coins: 1000, achievement: [], history: []))
        self._playerNameInput = State(initialValue: "")
        
        self._logIn = State(initialValue: false)
    }
    
    //MARK: - LOGIN FUNCTION
    func login(){
        if(playerNameInput == ""){return}
        
        let tPlayer = loadPlayer(playerName: playerNameInput)
        
        if(tPlayer == nil){
            player = Player(id: UUID(), playerName: playerNameInput, highScore: 0, coins: 1000, achievement: [], history: [])
            saveplayer(playerName: playerNameInput, saveplayer: player)
        } else {
            player = tPlayer!
        }

    }

    //MARK: Main menu Design
    var body: some View {
        
        ZStack {
            
            NavigationStack() {
                VStack {
                    
                    Spacer()
                    
                    LogoView(logoFileName: "Logo")
                    
                    Text("Barccart")
                        .fontWeight(.bold)
                        .font(.system(size:50))
                        .foregroundColor(.black)
                        
                    //MARK: ENTER USERNAME
                    HStack {
                        Text("Username:")
                            .font(.system(size:25))
                            .bold()
                        
                        if(!logIn){
                            TextField("Your Name", text: $playerNameInput)
                                .bold()
                                .background(.gray)
                                .multilineTextAlignment(.center)
                                .cornerRadius(40)
                            
                            Button{
                                login()
                                logIn = true
                                
                            } label: {
                                Text("Confirm")
                                    .bold()
                                    .background(Color(hue: 0.321, saturation: 1.0, brightness: 1.0))
                                    .cornerRadius(30)
                            }
                            
                            
                            
                        } else {
                            Text("\(player.playerName)")
                                .font(.system(size: 25))
                                .bold()
                        }
                    }
                    .padding(.leading, 10)
                    .padding(.trailing, 10)
                    
                    
                    //MARK: HIGHSCORE PLAYER DISPLAY
                    Text("Highscore: \(player.highScore)" )
                        .font(.system(size: 20))
                        .bold()
                    
                    
                    //MARK: NAVIGATION TO EACH VIEW
                    VStack {
                        if(logIn) {
                            NavigationLink {
                                GameView(mode: gameMode, player:Player(id: player.id, playerName: player.playerName, highScore: player.highScore, coins: player.coins, achievement: player.achievement, history: player.history))
                            } label:{
                                buttonMenu(disable: false, title: "PLAY")
                            }
                        } 
                        NavigationLink {
                            LeaderboardView(playerList: loadAllplayer() ?? [], userName: player.playerName)
                        } label:{
                            buttonMenu(disable: false, title: "LEADERBOARD")
                        }
                        
                        NavigationLink {
                            SettingView(gameMode: $gameMode)
                        } label:{
                            buttonMenu(disable: false, title: "SETTING")
                        }
                        
                        NavigationLink {
                            HelpView()
                        } label:{
                            buttonMenu(disable: false, title: "HOW TO PLAY")
                        }
                    }
                    
                    
                    Spacer()
                    
                }.onAppear(perform: {
                    login()
                    playSound(sound: "drum-music", type: "mp3")
                })
                
            }
        }.preferredColorScheme(isDarkMode ? .dark : .light)
        .onDisappear(perform: {
            audioPlayer?.stop()
        })
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView()
    }
}
