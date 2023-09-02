//
//  Modifier.swift
//  CardsGame
//
//  Created by Khoi Tran Minh on 25/08/2023.
//

import SwiftUI

struct ButtonModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .font(.title)
      .accentColor(Color.white)
      .padding()
  }
}

struct ShadowModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .shadow(color:Color("ColorBlackTransparent"), radius: 7)
    }
}



struct scoreNumberStyle: ViewModifier{
    func body(content: Content) -> some View {
        content
            .foregroundColor(.black)
            .font(.system(size: 20, weight: .heavy, design: .rounded))
    }
}

struct scoreLabelStyle: ViewModifier{
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color.black)
            .font(.system(size: 10, weight: .bold, design: .rounded))
    }
}

struct scoreCapsuleStyle: ViewModifier{
    func body(content: Content) -> some View {
        content
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .background(
                Capsule()
                    .foregroundColor(.red))
    }
}

struct CardImageModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .scaledToFit()
            .frame(width: 100, alignment: .center)
            .modifier(ShadowModifier())
    }
}

struct IconImageModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .scaledToFit()
            .frame(minWidth: 40, idealWidth: 60, maxWidth: 80, alignment: .center)
            .modifier(ShadowModifier())
    }
}
struct BetCapsuleModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .font(.system(size: 25, weight: .heavy, design: .rounded))
            .modifier(ShadowModifier())
            .background(
                Capsule().fill(LinearGradient(gradient: Gradient(colors: [Color.white, Color.red]), startPoint: .bottom, endPoint: .top))
                    .frame(width: 80, height: 50, alignment: .center)
            )
    }
}

struct CasinoChipModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .scaledToFit()
            .frame(height: 70)
            .modifier(ShadowModifier())
    }
}
