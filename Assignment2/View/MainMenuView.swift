

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
        print(player)

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
                            
                            
                            
                        } else {
                            Text("\(player.playerName)")
                                .font(.system(size: 25))
                                .bold()
                        }
                    }
                    .padding(.leading, 10)
                    .padding(.trailing, 10)
                    
                    Button{
                        login()
                        logIn = true
                    } label: {
                        Text("Save")
                            .bold()
                            .background(.green)
                            .cornerRadius(30)
                    }
                    
                    Button {
                        UserDefaults.standard.set([String:Data](), forKey: "players")
                    } label: {
                        Text("reset")
                    }
                    
                    Text("Highscore: \(player.highScore)" )
                        .font(.system(size: 20))
                        .bold()
                    
                    
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
                    print("APPEAR")
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
