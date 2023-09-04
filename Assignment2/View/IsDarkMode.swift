import SwiftUI


struct IsDarkMode: View {
    @AppStorage("isDarkMode") private var isDarkMode = false
    var body: some View {
        Toggle("Dark Mode", isOn: $isDarkMode).padding([.leading, .trailing], 50)
                
        
        
    }
}

struct isDarkMode_Previews: PreviewProvider {
    static var previews: some View {
        IsDarkMode()
    }
}
