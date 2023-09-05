//
//  Modifiers.swift
//  TaiXiuApp
//
//  Created by Nguyen Giang Huy on 01/09/2023.
//

import Foundation
import SwiftUI

struct ShadowModifiers: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: Color("BlackTransparentColor"), radius: 7)
    }
}

struct TableLabelModifiers: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .font(.system(size: 20, weight: .bold, design: .rounded))
    }
}

struct ScoreLabelModifiers: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .font(.system(size: 12, weight: .bold, design: .rounded))
    }
}

struct ScoreNumberModifiers: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .font(.system(size: 15, weight: .heavy, design: .rounded))
    }
}

struct ScoreCapsuleStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.horizontal,20)
            .padding(.vertical,10)
            .background(
                Capsule()
                    .foregroundColor(Color("BlackTransparentColor")))
    }
}

struct ReelImageModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .scaledToFit()
            .frame(height: 140)
            .modifier(ShadowModifiers())
    }
}

struct IconImageModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .scaledToFit()
            .frame(height: 80)
            .modifier(ShadowModifiers())
    }
}

struct BetCapsuleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .font(.system(size: 25,weight: .heavy, design: .rounded))
            .padding(.vertical,6)
            .padding(.horizontal,15)

            .modifier(ShadowModifiers())
            .background(
                Capsule()
                    .fill(
                        LinearGradient(gradient: Gradient(colors: [Color("RmitRed"), Color("RmitYellow")]), startPoint: .top, endPoint: .bottom)

                    )
            )
    }
}

struct CasinoChipModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .scaledToFit()
            .frame(height: 70)
            .modifier(ShadowModifiers())
    }
}

struct ButtonModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .font(.title)
      .accentColor(Color.white)
      .padding()
  }
}

struct CasinoChipsModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .scaledToFit()
            .modifier(ShadowModifiers())
    }
}
