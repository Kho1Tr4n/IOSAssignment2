//
//  LogoView.swift
//  CardsGame
//
//  Created by Khoi Tran Minh on 25/08/2023.
//

import SwiftUI

struct LogoView: View {
    var logoFileName: String
    var body: some View {
        Image("Logo")
                    .resizable()
                    .scaledToFit()
                    .frame(minHeight: 130, idealHeight: 170, maxHeight: 200, alignment: .center)
                    .modifier(ShadowModifier())
    }
}

struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        LogoView(logoFileName: "Logo")
    }
}
