//
//  CardView.swift
//  Assignment2
//
//  Created by Khoi Tran Minh on 30/08/2023.
//

import SwiftUI

struct CardView: View {
    var body: some View {
        Image("AceHeart")
            .resizable()
            .modifier(CardImageModifier())
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
