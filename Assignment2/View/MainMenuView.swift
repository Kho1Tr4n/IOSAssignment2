

import SwiftUI

struct MainMenuView: View {
    @State var playerNameInput: String = ""
    @State var player:Player
    @State var logIn : Bool
    @State var gameMode : String
    
    init(){
        self._player = State(initialValue: Player(id: UUID(), playerName: "", highScore: 0, coins: 1000, achievement: [], history: []))
        self._playerNameInput = State(initialValue: "")
        
        self._logIn = State(initialValue: false)
        let gMode = UserDefaults.standard.string(forKey: "mode") ?? "Easy"
        self._gameMode = State(initialValue: gMode)
    }
    
    //MARK : - LOGIN FUNCTION
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
                        
                    
                    Text("Username: \(playerNameInput)")
                        .font(.system(size:35))
                    Text("Highscore: ")
                    
                    
                    NavigationLink {
                        GameView()
                    } label:{
                        buttonMenu(disable: false, title: "NEW GAME")
                        
                    }
                    
                    
                    NavigationLink {
                        LeaderboardView(playerList: loadAllplayer() ?? [], userName: player.playerName)
                    } label:{
                        buttonMenu(disable: false, title: "LEADERBOARD")
                    }
                    
                    NavigationLink {
                        SettingView()
                    } label:{
                        buttonMenu(disable: false, title: "SETTING")
                    }
                    
                    NavigationLink {
                        HelpView()
                    } label:{
                        buttonMenu(disable: false, title: "HOW TO PLAY")
                    }
                    
                    Spacer()
                    
                  
                    
                    
                }
            }
        }
        .onAppear(perform: {
            playSound(sound: "drum-music", type: "mp3")
        })
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
