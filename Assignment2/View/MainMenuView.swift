

import SwiftUI

struct MainMenuView: View {
    @State var userName: String = ""
    @State var startGameView : Bool = false
    @State var userHas: Bool = false
    @State var userList : [String : Int] = UserDefaults.standard.object(forKey: "users") as? [String : Int] ?? [:]

    
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
                        
                    
                    Text("Username: \(userName)")
                        .font(.system(size:35))
                    Text("Highscore:")
                    
                    
                    NavigationLink {
                        GameView()
                    } label:{
                        buttonMenu(disable: false, title: "NEW GAME")
                    }
                    
                    
                    NavigationLink {
                        LeaderboardView()
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
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView()
    }
}
